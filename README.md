# Project description
Ecommerce app

# Build app

Web: https://flutter-74035.firebaseapp.com/#/login
flutter build [apk | web | aar]

# epitech-flutter
Flutter dev app epitech project

Description du project : The project will be an open subject, you can choose anything you want as long as it respects the following rules:

Prerequisites
- Your code must be at least in flutter 3.19.3 (stable channel)
- You must use these lints rules ↗ in your analysis_options file (you must use the 2.0.0 version at least).
- Your project must be functional
- We must be able to download at least the release version of your Android and the debug version for iOS (if you don't have an Apple developer account). You can use whatever means you want to render it downloadable (codemagic, firebase app distribution, diawi, testflight, the stores directly, etc…)
- We must be able to access the web part of your project online
- Your project must have a README describing how to deploy your app locally, what your project is about, the architecture of your project and what external libraries you used and why.

Basic functionalities
- You should have a user management system (login, register, ...) with at least a profile picture in your user info.
- You must have at least two types of users (admin and normal user for example) with different functionalities for each.
- You should use at least one native phone functionality (phone, camera, gps, gyroscope...)
- Your app must be in Flutter and work on Android and IOS and Web (responsive)
- You must use a global state management system (Redux, BloC, Provider, GetX,...)
- You must have at least one explicit animation
 
Advanced functionalities
- You can have a CI/CD for automatically testing and deploying your app
- You can have tests for your app (units/widget and/or integration)
- You can deploy your app to the stores
- You can have monitoring in place for your app (for KPIs and/or crash information)

Quality
- The command flutter analyze must be executed without issues found.
- Your code and your architecture will be reviewed
- The design and responsive capability of your app will be scored
- Your usage of git will be reviewed

# Architecture
Each feature has a views and controller folder
Widget used multiple time will have a widgets folder

# Package usage
firebase_core, firebase_auth, cloud_firestore, firebase_storage: These package are used for firebase and online db
get: GetX is used to ease the MVC structure of the project
image_picker, image_picker_for_web: 