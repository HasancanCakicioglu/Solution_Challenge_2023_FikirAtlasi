# Google Solution Challenge 2024 Project

## Overview

Currently, I am working on a project for the Google Solution Challenge 2024. The project is an open-source initiative aiming to find solutions to the country's problems. It encourages users to enhance each other's ideas through various tools such as text, video, photos, and PDFs, fostering a collaborative approach to creating solution proposals. The project is still in the development phase, with a deadline set for February 22.

## Technologies Used

- Flutter
- Firebase
- OpenAI (Embedding)
- Pinecone (Vector DB)
- Google Cloud Functions
- Secrets
- Storage
- Push notification
- Google ML Kit (on-device translation)

## Project Architecture

Following the principles of Uncle Bob:

- Data
- Domain
- Presentation

## Workflow

Google Cloud serves as a bridge, performing a search by first going to OpenAI Embedding. From there, the embedded data is sent to the vector database (Pinecone) for semantic search. The results are then retrieved from Firebase based on the received IDs. Google Maps is used for location selection, storing the location as geohashes to perform proximity ordering. This way, if any issue arises, it is localized to a specific user, and a push notification is sent to address it.

Feel free to explore the codebase and contribute to the development of this impactful project!
