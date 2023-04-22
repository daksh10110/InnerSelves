# Innerselves Flutter App

Innerselves is a Flutter app designed to help individuals with Dissociative Identity Disorder (DID) manage their alters in a secure and organized manner. The app consists of both frontend and backend components, providing features such as login, signup, profile creation and management, task tracking, journaling, and secure communication between alters.

The Innerselves Flutter app is specifically designed to assist individuals with Dissociative Identity Disorder (DID) in managing their alters, which are different personalities or identities that exist within the same individual. The app offers several advantages and benefits for users with DID:

1. **Organization and Management**: The app provides a centralized platform for users to create and manage profiles for their different alters. Users can easily switch between profiles, update profile details, and track tasks and journal entries associated with each alter. This helps users in organizing and managing their alters in a structured and efficient manner.

2. **Task Tracking**: The app allows users to create, retrieve, update, and delete tasks associated with specific alters. Users can set reminders, deadlines, and priorities for tasks, helping them stay organized and focused on their responsibilities and goals.

3. **Journaling**: The app provides a journaling feature that allows users to create, retrieve, update, and delete journal entries for each alter. Users can use the journal to document thoughts, feelings, and experiences related to each alter, helping them gain insights, reflect on their emotions, and improve self-awareness.

4. **Secure Communication**: The app offers a communication feature that enables users to send and receive direct messages (DMs) between different profiles for secure communication among their alters. This helps users facilitate communication and collaboration between different personalities within themselves, promoting healthy communication and understanding among alters.

5. **User-Friendly Interface**: The app has a user-friendly interface with intuitive navigation and easy-to-use features, making it accessible and convenient for individuals with DID to use and manage their alters effectively.

6. **Privacy and Security**: The app takes privacy and security seriously, with features such as user authentication and authorization to ensure that user data is protected. The use of Docker for backend containerization adds an additional layer of security for data management.

7. **Flutter Cross-Platform Development**: The app is built using Flutter, a cross-platform UI toolkit, allowing it to run on multiple platforms such as iOS, Android, and the web. This provides flexibility and versatility for users to access the app on different devices.

In summary, the Innerselves Flutter app provides a comprehensive solution for individuals with DID to manage their alters in an organized, secure, and efficient manner. With features such as profile creation and management, task tracking, journaling, and secure communication, the app can assist individuals with DID in better understanding and managing their condition, improving communication and collaboration among alters, and promoting self-awareness and well-being.

## Frontend

The frontend of Innerselves is built using Flutter, a popular UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase. The frontend includes the following pages:

- **Login Page**: Allows users to login with their credentials.
- **Signup Page**: Allows new users to create an account.
- **Profiles Page**: Displays a list of profiles for different alters, allowing users to choose their present alter or create a new profile for a new alter.
- **Profile Details Page**: Shows the name, age, and personality type of the selected alter, and provides buttons for tasks, communication, and journal features.
- **Tasks Page**: Allows users to create, retrieve, update, and delete tasks associated with a specific alter.
- **Journal Page**: Allows users to create, retrieve, update, and delete journal entries.
- **Communication Page**: Enables secure communication between different personalities through direct messages (DMs) to different profiles.

## Backend

The backend of Innerselves is built using Node.js, Express, PostgreSQL, and Docker. The backend handles various functionalities, including user authentication, profile creation and management, task tracking, journaling, and secure communication. It provides the following API endpoints:

- **Authentication Endpoints**: APIs for user authentication, such as login, signup, and logout.
- **Profile Endpoints**: APIs for creating, retrieving, updating, and deleting profiles for different alters.
- **Task Endpoints**: APIs for creating, retrieving, updating, and deleting tasks associated with specific alters.
- **Journal Endpoints**: APIs for creating, retrieving, updating, and deleting journal entries.
- **Communication Endpoints**: APIs for sending and receiving direct messages (DMs) between different profiles for secure communication.

The backend uses PostgreSQL as the database to store and manage user data, and it is containerized using Docker for easy deployment and management.

## Installation and Setup

To set up Innerselves, follow these steps:

1. Install Flutter, Node.js, and PostgreSQL on your development environment, if not already installed.
2. Clone the frontend and backend repositories from GitHub.
3. Configure the PostgreSQL database settings in the backend application, such as database name, username, password, and host.
4. Run `npm install` in the backend repository to install the required dependencies.
5. Build and run the Docker container for the backend using Docker commands or Docker Compose, specifying the appropriate configuration and environment settings.
6. Run the Flutter app on a connected device or emulator using Flutter commands.
7. Test the app and backend APIs using a REST client or other testing tools.

Note: Make sure to configure proper security measures, such as authentication, authorization, and input validation, in the backend to ensure the security and integrity of user data.

## Conclusion

Innerselves is a Flutter app that provides a comprehensive solution for individuals with DID to manage their alters in a secure and organized manner. The frontend and backend components work together to offer features such as profile creation and management, task tracking, journaling, and secure communication, providing a user-friendly and efficient solution for individuals with DID. With proper setup and configuration, Innerselves can be a valuable tool in helping individuals with DID manage their condition effectively.
