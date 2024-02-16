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


# 2024 GDSC Solution Challenge
- Project Overview
- Project Setup
- Implementation
- Feedback / Testing / Iteration
- Success and Completion of Solution
- Scalability / Next Steps

## Project Overview
### Please provide a 2-3 sentence overview of your project:

The project aims to address general issues of the country or individuals collectively with others, in other words, finding solutions to all kinds of problems together. Just like in open-source projects, everyone contributes others solutions, further developing it, and through these incremental improvements, a usable, real solution emerges

## Project Setup
### Please clearly describe the challenge you are solving for using a problem statement:
The current challenge revolves around empowering individuals to contribute and enhance solutions tailored to their specific areas of expertise, fostering a collaborative environment for continuous refinement and innovation.

### What United Nations' Sustainable Development goal(s) AND target(s) did you choose for your solution? What inspired you to select these specific goal(s) AND target(s)?

We tried to solve all the problems. What inspired us was the realization that many small improvements, when combined, make a significant difference. For example, nobody asks how to solve economic issues for a small business, but there may be small problems only they know about, which can apply to every profession. As these small problems are solved, a significant impact emerges.

## Implementation
### Describe the architecture that your team chose for your solution.
Our architecture utilizes the **Bloc state** management pattern in Flutter applications. We organize our project into **"core" and "features"** directories. Each feature has separate layers: **presentation, data, and domain**. Presentation handles UI, data manages data sources,domain contains business logic. This structure promotes modularity and separation of concerns, enhancing maintainability and scalability.

### What are the high-level components of your architecture? 
- Flutter
- Firebase
    - Firestore Database
    - Cloud Storage
    - Authhentication
    - Messaging
    - Machine Learning
    - Firebase functions
- Google Cloud
    - Secret Manager
    - Api
    - Cloud Functions
- Google Maps
- OpenAI
- Pinecone(Vector DB)
### What is the responsibility of each component?
- **Flutter**: Utilized for developing user interfaces for both Android and iOS platforms.
- **Firebase**:
  - **Firestore Database**: Serves as the primary database for storing application data in a NoSQL format.
  - **Cloud Storage**: Used for storing various types of files such as images, videos, and PDFs, which can then be downloaded and displayed within the application either through direct access or streaming.
  - **Authentication**: Provides user authentication services, ensuring secure access to the application's features and resources.
  - **Messaging**: Enables sending notifications to users, keeping them informed about important events or updates within the application, such as notifying users when a problem arises in their vicinity, asking if they would like to participate in addressing the issue.
  - **Machine Learning**: 
Firebase's on-device machine learning capabilities are employed for tasks such as real-time translation, enhancing user experience and accessibility by allowing users to translate text into their local language, free to use.
  - **Firebase Functions**: It serves as a bridge between OpenAI embedding and Pinecone Vector DB. When a search text is received from the Flutter application, it is embedded using OpenAI, then searched in Pinecone using semantic search. The IDs of the closest semantically similar sentences are retrieved. The content of these IDs is then fetched from Firebase. Additionally, when a document is created, it is embedded and saved to Pinecone, and if it has a location, a message is sent to nearby users using Firebase messaging.
- **Google Cloud**:
  - **Secret Manager**: Facilitates secure storage and management of sensitive information such as API keys, credentials, and configuration settings.
  - **API**: Provides access to various Google Cloud services and functionalities, allowing seamless integration with the application.
- **Google Maps**: Integrated for location-based services, enabling users to view and interact with maps, as well as providing functionalities such as geolocation and route planning within the application.
- **OpenAI**: Utilized for advanced text processing and understanding tasks, enabling natural language processing capabilities such as semantic search and language translation. It also facilitates embedding the given text according to its meaning and storing it in the vector database.
- **Pinecone (Vector DB)**: Employed for efficient storage and retrieval of embedded text representations, facilitating semantic search functionality within the application.
### Technical components - Backend, Frontend, Technologies, Programming languages and Tools used
**Backend**: Firebase was chosen for backend services, providing features like Firestore, Cloud Storage, Authentication, and Cloud Functions.

**Frontend**: Developed using Flutter, a cross-platform framework for building mobile applications.

**Technologies**: Utilized Dart programming language for Flutter development.

**Tools used**: Integrated Firebase SDKs and plugins into the Flutter application for backend functionality, while leveraging Flutter's built-in development tools for efficient development and debugging.
### Which specific products and platforms did you choose to implement these components and why?
We opted for Google technologies due to their user-friendly interfaces, professional reliability, and cost-effective free tier options. Leveraging these platforms allowed us to develop our application with advanced features and robust functionality while ensuring scalability and efficiency in the development process.

## Feedback / Testing / Iteration
### Walk us through the steps you took to test your solution with real users (outside of your team). Provide three specific feedback points you received from real users. What did you learn and how did it help improve your solution? What are three specific things you implemented and improved for your solution based on the feedback from users?

- Awareness of Nearby Problems:
Users emphasized the importance of staying informed about local issues. To meet this need, we integrated geohashing and geo queries. This feature notifies users of nearby problems, empowering them to take proactive action and contribute to resolving community challenges effectively.

- Duplicate Problem Detection:
Users stressed the need to avoid duplicate problem reports. To address this, we implemented semantic search. This enhancement allows users to identify similar issues before submitting new reports, streamlining their problem-solving efforts and maintaining a comprehensive database of community issues.

- Multilingual Support:
User feedback highlighted the importance of multilingual support. To accommodate diverse language backgrounds, we integrated on-device machine learning translation. This feature enables seamless translation of application content, fostering inclusivity and enhancing the user experience for all users.

### Highlight one challenge you faced while building your code, including detail on how you addressed the issue and the technical decisions and implementations you had to make.
The problem I encountered still remains open in the Flutter issues. Issue Link: https://github.com/flutter/flutter/issues/81152

The issue is this: I have two tab bars on the same page, each containing ListViewBuilders. When any ListViewBuilder is scrolled, the SliverAppBar and bottom bar disappear to improve user experience. I need to know when the ListViewBuilders reach the bottom so that I can fetch new data from Firebase. To solve this, I accessed the NestedScrollView's inner controller using PrimaryScrollController.of(context) to check if the ListViewBuilder reached the end. It worked fine in the first tab but not in the second tab because one scroll controller was assigned to both ListViewBuilders. To fix this, I assigned separate scroll controllers to the NestedScrollView and the ListViewBuilders in each tab. These custom controllers were extended and enhanced to accurately track the scrolling position in pixels, allowing the NestedScrollView's controller to jumpTo the correct position, resulting in smooth functionality.

## Success and Completion of Solution
### Please describe your project's impact using cause and effect.
Our project's implementation of a community-driven platform led to increased community engagement and collaboration in addressing issues, resulting in tangible improvements in problems
### How does your solution address the problem you are looking to solve?
Our solution is based on everyone having knowledge in certain areas. It aims for individuals to collaborate and find solutions to certain problems based on the knowledge they possess.
### How were some of the goals of your solution evidenced?
As I looked into open-source projects, I noticed that people contribute to codes of individuals they've never met before, resulting in the creation of usable projects. I thought, why not apply this to general problems, and that's how I reached this conclusion.
### What tools did you use to help understand your solution's impact?
Users can provide feedback or like solutions or problems in the application, allowing us to see their impact more clearly as interaction with the application increases.

## Scalability / Next Steps
### What do you see as the future / next steps for your project? How would you expand your solution to reach a larger audience?
In the future, the application will appeal to a broader audience as it grows through word-of-mouth recommendations from users who find solutions to their problems while using it. As the structure of problems evolves over time, the goal is to encourage everyone to look at a problem from multiple perspectives, enabling them to contribute in areas they are knowledgeable about.
### Explain how the technical architecture of your solution could support (in its current state or with minor changes) scaling to a larger audience.
I chose databases like Firebase and Pinecone because they are scalable. As the application grows, we'll apply more testing and optimization techniques related to code efficiency. Additionally, these databases offer features that align well with our project requirements, such as real-time synchronization, offline capabilities, and semantic search. This ensures that our application can handle increased user loads and maintain optimal performance as it scales.
