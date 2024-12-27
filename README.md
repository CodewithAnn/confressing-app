# Confressing App

A new Flutter project for video conferencing using Jitsi Meet.
  #### Features
User authentication with Firebase
Video conferencing using Jitsi Meet
Meeting history stored in Firestore
Mute audio and video options

## Getting Started

This project is a starting point for a Flutter application that integrates with Jitsi Meet for video conferencing.

## Prerequisites

Before you begin, ensure you have met the following requirements:
- You have installed the latest version of [Flutter](https://flutter.dev/docs/get-started/install).
- You have installed [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/) with the Flutter and Dart plugins.
- You have a Firebase project set up with Firestore and Authentication enabled.

## Setup

Follow these steps to set up and run the project locally:

### 1. Clone the Repository

```sh
git clone https://github.com/your-username/confressing_app.git
cd confessing_app
```
### 2. Install Dependencies
  ```sh 
  flutter pub get
  ```
 ### 3. Configure Firebase
Go to the Firebase Console.
Create a new project or select an existing project.
Add an Android app to your Firebase project.
Download the google-services.json file and place it in the app directory.
Add the SHA-1 fingerprint of your app to the Firebase project settings.

