<div align="center">

# 🎬 TikTok Clone - Short Video Social Platform

### *Next-Generation Video Sharing Experience Built with Flutter*

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com)
[![GetX](https://img.shields.io/badge/GetX-8A2BE2?style=for-the-badge&logo=flutter&logoColor=white)](https://pub.dev/packages/get)
[![Cloudinary](https://img.shields.io/badge/Cloudinary-3448C5?style=for-the-badge&logo=cloudinary&logoColor=white)](https://cloudinary.com)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)



**A production-ready short video social media platform featuring real-time interactions, video compression, cloud storage, and seamless cross-platform experience**

[✨ Features](#-features) • [🚀 Quick Start](#-getting-started) • [🏗️ Architecture](#-architecture) • [📚 API Reference](#-firebase-structure) 
---

</div>

## 📋 Table of Contents

- [About](#-about-the-project)
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Architecture](#-architecture)
- [Firebase Setup](#-firebase-setup)
- [Cloudinary Setup](#-cloudinary-setup)
- [Project Structure](#-project-structure)
- [State Management](#-state-management)
- [Firebase Structure](#-firebase-structure)


---

## 🎯 About The Project

This is a **full-featured TikTok clone** built with Flutter, Firebase, and Cloudinary. It replicates the core functionality of TikTok including vertical video scrolling, real-time interactions, user profiles, and a complete social networking experience. The app is production-ready with video compression, cloud storage, and real-time data synchronization.

### 🌟 Why This Project?

- 🎥 **Full Video Pipeline** - Upload, compress, store, and stream videos seamlessly
- 🔥 **Firebase Backend** - Real-time database with authentication
- ☁️ **Cloud Storage** - Scalable media hosting with Cloudinary
- 🚀 **GetX State Management** - Reactive and efficient state handling
- 📱 **Cross-Platform** - Single codebase for Android, iOS, Web, and Desktop
- 🎨 **Modern UI** - Sleek dark theme with smooth animations
- 💬 **Real-Time Interactions** - Live comments, likes, and follows
- 🔍 **User Discovery** - Search and explore user profiles

---

## ✨ Features

### 🔐 Authentication & User Management
- ✅ Email/Password authentication via Firebase
- ✅ User registration with profile picture upload
- ✅ Secure session management
- ✅ Auto-routing based on authentication state
- ✅ Login/Logout functionality
- ✅ Profile picture upload to Cloudinary

### 🎥 Video Features
- ✅ **Video Upload** - Pick from gallery or record with camera
- ✅ **Video Compression** - Automatic compression to medium quality
- ✅ **Thumbnail Generation** - Auto-generated video thumbnails
- ✅ **Vertical Feed** - TikTok-style vertical scrolling
- ✅ **Video Player** - Custom video playback with controls
- ✅ **Cloud Storage** - Cloudinary integration for scalable hosting
- ✅ **Video Metadata** - Song name, caption, and user info

### 💬 Social Interactions
- ✅ **Like Videos** - Toggle like/unlike with real-time updates
- ✅ **Comments** - Post and view comments on videos
- ✅ **Like Comments** - Engage with individual comments
- ✅ **Follow/Unfollow** - Build your social network
- ✅ **Follower Counts** - Track followers and following
- ✅ **User Profiles** - View detailed user profiles with video grids

### 🔍 Discovery & Engagement
- ✅ **User Search** - Find users by name in real-time
- ✅ **Profile Views** - Explore other users' content
- ✅ **Video Grid** - Thumbnail grid of user uploads
- ✅ **Engagement Metrics** - View likes, comments, and shares

### 🎨 UI/UX Features
- ✅ Modern dark theme
- ✅ Smooth animations and transitions
- ✅ Responsive design for all screen sizes
- ✅ Bottom navigation with 5 tabs
- ✅ Real-time data updates
- ✅ Toast notifications for user feedback
- ✅ Loading indicators and error handling

---

### App Flow Preview
```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Login     │ →  │    Home     │ →  │   Upload    │ →  │  Comments   │
│   Screen    │    │   Feed      │    │   Video     │    │   Screen    │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
       ↓                  ↓                  ↓                   ↓
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Register   │    │   Search    │    │   Confirm   │    │   Profile   │
│   Screen    │    │   Users     │    │   Video     │    │   Screen    │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
```

---

## 🛠 Tech Stack

### Core Technologies

| Technology | Purpose | Version |
|------------|---------|---------|
| **Flutter** | Cross-platform UI framework | Latest |
| **Dart** | Programming language | Latest |
| **Firebase Auth** | User authentication | Latest |
| **Cloud Firestore** | NoSQL database | Latest |
| **Cloudinary** | Media storage & CDN | Latest |
| **GetX** | State management & routing | ^4.6.6 |

### Key Dependencies

```yaml
# State Management & Navigation
get: ^4.6.6

# Firebase
firebase_auth: ^4.15.3
firebase_core: ^2.24.2
cloud_firestore: ^4.13.6
firebase_storage: ^11.5.6

# Media Handling
image_picker: ^1.0.5
video_player: ^2.8.1
video_compress: ^3.1.2
cloudinary_public: ^0.21.0

# UI Enhancement
cached_network_image: ^3.3.0
timeago: ^3.6.0
```

---

## 🏗 Architecture

### High-Level Architecture

```
┌──────────────────────────────────────────────────────────┐
│                    Flutter Frontend                      │
│              (Android, iOS, Web, Desktop)                │
├──────────────────────────────────────────────────────────┤
│                   GetX Controllers                       │
│   AuthController │ VideoController │ ProfileController   │
├──────────────────────────────────────────────────────────┤
│                   Firebase Backend                       │
│  ┌────────────┬──────────────┬─────────────────┐       │
│  │ Firebase   │  Firestore   │ Cloud Functions │       │
│  │    Auth    │   Database   │   (Optional)    │       │
│  └────────────┴──────────────┴─────────────────┘       │
├──────────────────────────────────────────────────────────┤
│                  Cloudinary CDN                          │
│          (Videos, Images, Thumbnails)                    │
└──────────────────────────────────────────────────────────┘
```

### MVC Pattern with GetX

```dart
┌─────────────┐     ┌──────────────┐     ┌─────────────┐
│   View      │ ←→  │  Controller  │ ←→  │   Model     │
│  (Screen)   │     │   (Logic)    │     │   (Data)    │
└─────────────┘     └──────────────┘     └─────────────┘
```


### Installation Steps

#### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/tiktok-clone.git
cd tiktok-clone
```

#### 2. Install Dependencies
```bash
flutter pub get
```

#### 3. Configure Firebase (See [Firebase Setup](#-firebase-setup))

#### 4. Configure Cloudinary (See [Cloudinary Setup](#-cloudinary-setup))

#### 5. Run the App
```bash
# Check for connected devices
flutter devices

# Run on connected device/emulator
flutter run

# Run in release mode
flutter run --release
```

---

## 🔥 Firebase Setup

### Step 1: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Click **"Add project"**
3. Enter project name (e.g., "TikTok Clone")
4. Enable Google Analytics (optional)
5. Click **"Create project"**

### Step 2: Add Flutter App to Firebase

#### For Android:
```bash
# Run FlutterFire CLI
flutterfire configure
```

Or manually:
1. Download `google-services.json`
2. Place in `android/app/`
3. Update `android/build.gradle`:
```gradle
dependencies {
    classpath 'com.google.gms:google-services:4.3.15'
}
```
4. Update `android/app/build.gradle`:
```gradle
apply plugin: 'com.google.gms.google-services'
```

#### For iOS:
1. Download `GoogleService-Info.plist`
2. Place in `ios/Runner/`
3. Open Xcode and add file to project

### Step 3: Enable Firebase Services

#### Enable Authentication:
1. Go to **Authentication** → **Sign-in method**
2. Enable **Email/Password**

#### Enable Firestore Database:
1. Go to **Firestore Database** → **Create database**
2. Start in **Test mode** (change rules later)
3. Choose location closest to users

#### Firestore Security Rules:
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users collection
    match /users/{userId} {
      allow read: if true;
      allow write: if request.auth != null && request.auth.uid == userId;
      
      // Followers & Following subcollections
      match /{document=**} {
        allow read: if true;
        allow write: if request.auth != null;
      }
    }
    
    // Videos collection
    match /videos/{videoId} {
      allow read: if true;
      allow create: if request.auth != null;
      allow update: if request.auth != null;
      allow delete: if request.auth != null && 
                      resource.data.uid == request.auth.uid;
      
      // Comments subcollection
      match /comments/{commentId} {
        allow read: if true;
        allow write: if request.auth != null;
      }
    }
  }
}
```

---

## ☁️ Cloudinary Setup

### Step 1: Create Cloudinary Account
1. Sign up at [Cloudinary](https://cloudinary.com)
2. Note your **Cloud Name**, **API Key**, and **API Secret**

### Step 2: Configure in App

Open `lib/constants.dart` and add your credentials:

```dart
const String cloudName = 'your_cloud_name';
const String uploadPreset = 'your_upload_preset';
```

### Step 3: Create Upload Preset
1. Go to **Settings** → **Upload**
2. Scroll to **Upload presets**
3. Click **Add upload preset**
4. Set **Signing Mode** to **Unsigned**
5. Name your preset (e.g., `tiktok_videos`)
6. Configure folders:
   - Videos: `tiktok/videos`
   - Thumbnails: `tiktok/thumbnails`
   - Profile pics: `tiktok/profiles`

---

## 📁 Project Structure

```
tiktok_clone/
│
├── lib/
│   ├── main.dart                         # App entry point
│   │
│   ├── constants.dart                    # Global constants & configs
│   │                                     # - Firebase config
│   │                                     # - Cloudinary credentials
│   │                                     # - Color schemes
│   │                                     # - Text styles
│   │
│   ├── controllers/                      # GetX Controllers
│   │   ├── auth_controller.dart          # Authentication logic
│   │   │                                 # - SignUp, Login, Logout
│   │   │                                 # - Session management
│   │   ├── video_controller.dart         # Video feed management
│   │   │                                 # - Fetch videos
│   │   │                                 # - Like/Unlike videos
│   │   ├── upload_video_controller.dart  # Video upload pipeline
│   │   │                                 # - Video compression
│   │   │                                 # - Cloudinary upload
│   │   │                                 # - Firestore storage
│   │   ├── comment_controller.dart       # Comments system
│   │   │                                 # - Post comments
│   │   │                                 # - Like comments
│   │   ├── profile_controller.dart       # User profiles
│   │   │                                 # - Follow/Unfollow
│   │   │                                 # - Get user videos
│   │   └── search_controller.dart        # User search
│   │                                     # - Real-time search
│   │
│   ├── models/                           # Data Models
│   │   ├── user.dart                     # User data model
│   │   │   ├── name, email, uid
│   │   │   ├── profilePic
│   │   │   └── followers/following
│   │   ├── video.dart                    # Video data model
│   │   │   ├── videoUrl, thumbnail
│   │   │   ├── likes, comments, shares
│   │   │   └── songName, caption
│   │   └── comment.dart                  # Comment data model
│   │       ├── comment text
│   │       ├── user info
│   │       └── likes, datePublished
│   │
│   ├── views/                            # UI Screens
│   │   ├── screens/
│   │   │   ├── auth/
│   │   │   │   ├── login_screen.dart     # Login UI
│   │   │   │   └── signup_screen.dart    # Registration UI
│   │   │   ├── home_screen.dart          # Bottom navigation hub
│   │   │   ├── video_screen.dart         # Video feed (main screen)
│   │   │   ├── search_screen.dart        # User search
│   │   │   ├── add_video_screen.dart     # Upload options
│   │   │   ├── confirm_screen.dart       # Video preview before upload
│   │   │   ├── comment_screen.dart       # Comments interface
│   │   │   ├── profile_screen.dart       # User profile
│   │   │   └── notification_screen.dart  # Notifications (placeholder)
│   │   │
│   │   └── widgets/                      # Reusable UI Components
│   │       ├── custom_icon.dart          # Custom icon widgets
│   │       ├── text_input_field.dart     # Styled input fields
│   │       ├── video_player_item.dart    # Video player component
│   │       └── circle_animation.dart     # Animated profile pic
│   │
│   └── utils/                            # Utility Functions
│       └── pick_video.dart               # Video picker helper
│
├── android/                              # Android native code
├── ios/                                  # iOS native code
├── web/                                  # Web platform files
├── windows/                              # Windows platform files
├── linux/                                # Linux platform files
├── macos/                                # macOS platform files
│
├── assets/                               # Static assets (if any)
├── pubspec.yaml                          # Dependencies & metadata
└── README.md                             # Project documentation
```

---

## 🎮 State Management

### GetX Pattern

This project uses **GetX** for state management, dependency injection, and routing.

#### Controllers

```dart
// Example: AuthController
class AuthController extends GetxController {
  static AuthController instance = Get.find();
  
  late Rx<User?> _user;
  
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }
  
  // Methods: signUp(), login(), signOut()
}
```

#### Reactive Variables

```dart
// Observable variables
Rx<String> videoUrl = ''.obs;
RxList<Video> videoList = <Video>[].obs;
RxInt likeCount = 0.obs;

// Update UI automatically
likeCount.value++;
```

#### Dependency Injection

```dart
void main() {
  Get.put(AuthController());
  Get.lazyPut(() => VideoController());
  runApp(MyApp());
}
```

---

## 🔥 Firebase Structure

### Firestore Collections

#### 1. Users Collection
```
firestore/users/
├── [uid]/
│   ├── name: String
│   ├── email: String
│   ├── uid: String
│   ├── profilePic: String (Cloudinary URL)
│   │
│   ├── followers/
│   │   └── [followerId]/
│   │       └── uid: String
│   │
│   └── following/
│       └── [followingId]/
│           └── uid: String
```

#### 2. Videos Collection
```
firestore/videos/
├── [videoId]/
│   ├── id: String
│   ├── uid: String (uploader)
│   ├── username: String
│   ├── profilePhoto: String
│   ├── videoUrl: String (Cloudinary URL)
│   ├── thumbnail: String (Cloudinary URL)
│   ├── songName: String
│   ├── caption: String
│   ├── likes: Array<String> (user UIDs)
│   ├── commentCount: int
│   ├── shareCount: int
│   ├── datePublished: Timestamp
│   │
│   └── comments/
│       └── [commentId]/
│           ├── comment: String
│           ├── username: String
│           ├── uid: String
│           ├── profilePic: String
│           ├── likes: Array<String>
│           └── datePublished: Timestamp
```

### Data Relationships

```
User (1) ─────── (N) Videos
  │
  │ followers/
  └─────────────── (N) Users
  │
  │ following/
  └─────────────── (N) Users

Video (1) ─────── (N) Comments
  │
  │ likes[]
  └─────────────── (N) Users

Comment (1) ───── (N) Likes
```

---

## 🎬 Features Deep Dive

### 1. Video Upload Pipeline

```
┌──────────────┐
│ Pick Video   │ → Gallery or Camera
└──────┬───────┘
       │
       ↓
┌──────────────┐
│  Compress    │ → Medium Quality (reduces file size)
└──────┬───────┘
       │
       ↓
┌──────────────┐
│  Generate    │ → Auto-create thumbnail
│  Thumbnail   │
└──────┬───────┘
       │
       ↓
┌──────────────┐
│  Upload to   │ → Cloudinary (video + thumbnail)
│  Cloudinary  │
└──────┬───────┘
       │
       ↓
┌──────────────┐
│  Save to     │ → Firestore (metadata + URLs)
│  Firestore   │
└──────┬───────┘
       │
       ↓
┌──────────────┐
│  Show in     │ → Real-time stream binding
│    Feed      │
└──────────────┘
```

### 2. Like/Unlike System

```dart
// Like video logic
Future<void> likeVideo(String videoId) async {
  DocumentSnapshot doc = await firestore
      .collection('videos')
      .doc(videoId)
      .get();
  
  var uid = authController.user.uid;
  
  if ((doc.data()! as dynamic)['likes'].contains(uid)) {
    // Unlike
    await firestore.collection('videos').doc(videoId).update({
      'likes': FieldValue.arrayRemove([uid])
    });
  } else {
    // Like
    await firestore.collection('videos').doc(videoId).update({
      'likes': FieldValue.arrayUnion([uid])
    });
  }
}
```

### 3. Real-Time Comment System

```dart
// Post comment
Future<void> postComment(String commentText) async {
  if (commentText.isNotEmpty) {
    String commentId = const Uuid().v1();
    
    await firestore
        .collection('videos')
        .doc(videoId)
        .collection('comments')
        .doc(commentId)
        .set({
      'comment': commentText,
      'username': authController.user.displayName,
      'uid': authController.user.uid,
      'profilePic': authController.user.photoURL,
      'likes': [],
      'datePublished': DateTime.now()
    });
    
    // Increment comment count
    await firestore.collection('videos').doc(videoId).update({
      'commentCount': FieldValue.increment(1)
    });
  }
}
```

### 4. Follow/Unfollow Logic

```dart
Future<void> followUser() async {
  var doc = await firestore.collection('users').doc(uid).get();
  
  if ((doc.data()!['followers'] as List).contains(authController.user.uid)) {
    // Unfollow
    await firestore.collection('users').doc(uid).update({
      'followers': FieldValue.arrayRemove([authController.user.uid])
    });
    
    await firestore.collection('users')
        .doc(authController.user.uid)
        .update({
      'following': FieldValue.arrayRemove([uid])
    });
  } else {
    // Follow
    await firestore.collection('users').doc(uid).update({
      'followers': FieldValue.arrayUnion([authController.user.uid])
    });
    
    await firestore.collection('users')
        .doc(authController.user.uid)
        .update({
      'following': FieldValue.arrayUnion([uid])
    });
  }
}
```

---

## 🧪 Testing

### Run Tests
```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Integration tests
flutter drive --target=test_driver/app.dart
```

---

## 🏗 Build & Deploy

### Android Build
```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# App Bundle (for Play Store)
flutter build appbundle --release
```

### iOS Build
```bash
# Build iOS app (macOS only)
flutter build ios --release

# Open Xcode for archiving
open ios/Runner.xcworkspace
```

### Web Build
```bash
flutter build web --release

# Deploy to Firebase Hosting
firebase deploy --only hosting
```

---

## 🚦 Roadmap

### ✅ Completed Features
- [x] User authentication (Email/Password)
- [x] Video upload with compression
- [x] Vertical video feed
- [x] Like/Unlike videos
- [x] Comment system
- [x] Follow/Unfollow users
- [x] User search
- [x] Profile pages
- [x] Real-time data sync

### 🔄 In Progress
- [ ] Notification system
- [ ] Push notifications
- [ ] Video sharing functionality

### 📋 Planned Features
- [ ] **Stories** - 24-hour disappearing content
- [ ] **Direct Messaging** - Chat with other users
- [ ] **Hashtags** - Trending topics and challenges
- [ ] **Sound Library** - Music/audio selection for videos
- [ ] **Filters & Effects** - Video editing tools
- [ ] **Live Streaming** - Real-time broadcasts
- [ ] **Analytics Dashboard** - Video performance metrics
- [ ] **Dark/Light Theme** - Theme switching
- [ ] **Multi-language Support** - i18n implementation
- [ ] **Video Duets** - Collaborate with other videos
- [ ] **Save to Favorites** - Bookmark videos
- [ ] **Report & Block** - Safety features
- [ ] **Advanced Search** - Filter by hashtags, sounds
- [ ] **Monetization** - Creator fund integration

---

## 🐛 Known Issues

- [ ] Video compression may take time on older devices
- [ ] iOS requires additional permissions configuration
- [ ] Web platform has limited video functionality
- [ ] Large videos (>100MB) may fail to upload

---


## 📊 Project Statistics

| Metric | Value |
|--------|-------|
| **Total Files** | 153 |
| **Lines of Code** | 7,254+ |
| **Screens** | 10 |
| **Controllers** | 6 |
| **Models** | 3 |
| **Platforms** | 6 (Android, iOS, Web, Windows, Linux, macOS) |
| **Dependencies** | 15+ |

---

## 🔒 Security & Privacy

- ✅ Firebase Authentication for secure login
- ✅ Firestore Security Rules implemented
- ✅ User data encryption in transit
- ✅ Password hashing via Firebase
- ✅ Environment variables for sensitive data
- ⚠️ **Note**: Change Firestore rules to production mode before deployment

---


<div align="center">

