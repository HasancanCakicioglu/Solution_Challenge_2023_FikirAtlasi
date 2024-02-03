/* eslint-disable @typescript-eslint/no-var-requires */
/* eslint-disable max-len, no-trailing-spaces, object-curly-spacing*/

// Import necessary modules and libraries
const { DocumentSnapshot} = require("firebase-functions/v2/firestore");
import { onDocumentCreated } from "firebase-functions/v2/firestore";
const { onCall } = require("firebase-functions/v2/https");
import { initializeApp } from "firebase-admin/app";
import fetch from "node-fetch";
import { Pinecone, QueryResponse } from "@pinecone-database/pinecone";
require("dotenv").config();
const admin = require("firebase-admin");
import { setGlobalOptions } from "firebase-functions/v2";


// Set the maximum instances to 10 for all functions

setGlobalOptions({ maxInstances: 1 });

// Initialize Firebase Admin
initializeApp();
const firestore = admin.firestore();
const messaging = admin.messaging();
// Set Pinecone API key from environment variables
const PineconeApi = process.env.PINECONE_API;
const pc = new Pinecone({ apiKey: PineconeApi as string });
const index = pc.index(process.env.INDEX_NAME as string);

// Get OpenAI API key from environment variables
const OpenAIApiKey = process.env.OPENAI_API;

exports.semanticSearch = onCall({ region: "europe-west3" },
  async (request: any) => {
    // Check if the request is authenticated

    // Extract text from the request data
    const searchText = request.data.text;

    const embeddedData = await getOpenAIEmbedding(
      searchText,
      OpenAIApiKey as string
    );
    // Call Pinecone for semantic search with default parameters
    const results = await semanticSearchPinecone(embeddedData);
    const idList: string[] = results.matches.map((item) => item.id);

    const jsonData = JSON.stringify(idList);
    return jsonData;
  }
);

/**
 * Performs a semantic search using Pinecone API.
 * 
 * @param {number[]} [vector=[0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3]] - The vector for semantic search.
 * @param {number} [topK=3] - The number of top results to retrieve.
 * @param {boolean} [includeValues=true] - Whether to include values in the search results.
 * 
 * @return {Promise<QueryResponse>} - A promise that resolves with the search results.
 */
async function semanticSearchPinecone(
  vector: number[],
  topK = 20,
  includeValues = true
): Promise<QueryResponse> {
  // Make a request to Pinecone for semantic search
  const queryResponse = await index.query({
    vector: vector,
    topK: topK,
    includeValues: includeValues,
  });

  return queryResponse;
}

// Firebase Cloud Function triggered on document creation
exports.OpenAIembeddingAndSaveToPineCone = onDocumentCreated(
  { document: "/Comments/{documentId}", region: "europe-west3" },
  async (event: typeof DocumentSnapshot) => {
    // Extract data from the Firestore document
    const documentData = event.data.data();
    const uid = documentData.uid;
    const text = documentData.text;
    const title = documentData.title;
    const geoHash = documentData.geoFirePoint;

    if (geoHash !== null) {
      console.log(geoHash);
      const geohashFieldName = geoHash.geohash.substring(0, 2);
      console.log(geohashFieldName);
      const querySnapshot = await firestore.collection("Profiles")
        .where("geoFirePoint.geohash", ">=", geohashFieldName)
        .where("geoFirePoint.geohash", "<", geohashFieldName + "\uf8ff")
        .where("isNotificationOpen", "==", true)
        .get();

      const matchingFcmTokens: string[] = [];
      querySnapshot.forEach((doc: typeof DocumentSnapshot) => {
        const fcmToken = doc.data()["fcmToken"];
        matchingFcmTokens.push(fcmToken);
      });

      const message = {
        tokens: matchingFcmTokens,
        notification: {title: "Yakınınızda bir problem çıktı!", body: title},
      };
      console.log(matchingFcmTokens.length);
      if (matchingFcmTokens.length > 0) {
        messaging.sendEachForMulticast(message);
      }
    }

    const date = Date.parse(documentData.date);

    // Convert date string to a Date object
    const dateObject: Date = new Date(date);
    const yourText = text + title;
    
    // Fetch OpenAI embedding for the text
    const embeddedData = await getOpenAIEmbedding(
      yourText,
      OpenAIApiKey as string
    );

    // Extract year, month, and day from the date object
    const dateFilter: DateInterface = {
      Year: dateObject.getFullYear(),
      Month: dateObject.getMonth() + 1,
      Day: dateObject.getDate(),
    };

    // Upsert data to Pinecone index
    await toPinecone(uid, embeddedData, dateFilter);
  }
);

/**
 * Fetch OpenAI embedding for the given text.
 * @param {string} text - Text to get the embedding for.
 * @param {string} openaiApiKey - OpenAI API key.
 * @return {Promise<number[]>} - Embedding array.
 */
async function getOpenAIEmbedding(
  text: string,
  openaiApiKey: string
): Promise<number[]> {
  const url = "https://api.openai.com/v1/embeddings";
  const headers = {
    "Content-Type": "application/json",
    "Authorization": `Bearer ${openaiApiKey}`,
  };
  const body = JSON.stringify({
    input: text,
    model: "text-embedding-ada-002",
  });

  try {
    const response = await fetch(url, { method: "POST", headers, body });
    const data = await response.json();

    return data.data[0].embedding;
  } catch (error) {
    console.error("Error fetching embedding:", error);
    throw error;
  }
}

// Interface to represent the date structure
interface DateInterface {
  Year: number;
  Month: number;
  Day: number;
}

/**
 * Upsert data to Pinecone index.
 * @param {string} id - Data ID.
 * @param {number[]} vector - Embedding vector.
 * @param {DateInterface} filter - Date filter.
 * @return {Promise<void>}
 */
async function toPinecone(
  id: string,
  vector: number[],
  filter: DateInterface
): Promise<void> {
  const { Year, Month, Day } = filter;
  await index.upsert([
    {
      id: id,
      values: vector,
      metadata: {
        Year: Year,
        Month: Month,
        Day: Day,
      },
    },
  ]);
}
