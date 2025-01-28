# Firebase CRUD App

A simple Flutter app demonstrating **Firebase Firestore CRUD operations** for user management.

## Key Features
- **Add Users**:  
  - Collect name, age, and hobby via form.  
  - Data validation and snackbar feedback.  
- **View Users**:  
  - Display users in a scrollable list.  
  - Real-time data fetching from Firestore.  
- **Firebase Integration**:  
  - Cloud Firestore for data storage.  
  - Automatic document ID generation.  

## Project Structure
| File                 | Purpose                                  |
|----------------------|------------------------------------------|
| `main.dart`          | App entry & Firebase initialization      |
| `users_services.dart`| Firestore operations (add/get users)     |
| `user_model.dart`    | User data model & Firestore converters   |
| `add_user.dart`      | Add user form UI + submission logic      |
| `show_users.dart`    | Display users list from Firestore        |

## Data Flow
1. User inputs → `UserModel` → Firestore via `FirebaseUserServices`  
2. Firestore documents → `UserModel` → ListView in `ShowUsersScreen`

## Dependencies
- `firebase_core`  
- `cloud_firestore`  
- `flutter/material` (core UI)

## Setup
1. Enable Firestore in Firebase Console  
2. Add Firebase config files  
3. Create 'users' collection in Firestore  
4. Run `flutter pub get && flutter run`

---

## Output
**Screenshots**
<p align="center"><img src="https://github.com/user-attachments/assets/f1543a5b-a61c-4afb-a771-e31303888314" alt="Add Users" height="844" width="431.38"/></p>
<p align="center"><img src="https://github.com/user-attachments/assets/64a4708e-ea65-41c8-aa35-1a92f42d2973" alt="Show Users" height="844" width="431.38"/></p>

**Video**

https://github.com/user-attachments/assets/44435562-013d-41f5-b796-6ff6f9b9c674

---

**Note**: Demonstrates basic Firestore read/write operations with clean architecture.  