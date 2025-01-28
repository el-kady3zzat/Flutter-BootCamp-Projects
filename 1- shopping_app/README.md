# Flutter Auth & Shopping App

A Flutter app with **Firebase Authentication**, **Bloc state management**, and a shopping interface. Users can register, log in, and browse products.

## Key Features
- **Authentication**:  
  - Firebase-powered registration/login with error handling.  
  - Login state persistence via `SharedPreferences`.  
- **State Management**:  
  - Bloc pattern for handling auth states (`AuthBloc`, `AuthEvent`, `AuthState`).  
- **Shopping Page**:  
  - Product carousels, grids, and hot offers.  
  - Responsive UI with `SizeConfig` for screen adaptation.  
- **Localization**:  
  - Supports English and Arabic via `EasyLocalization`.  

## Project Structure
| File                | Purpose                                  |
|---------------------|------------------------------------------|
| `auth_services.dart`| Firebase auth logic (register/login).    |
| `user_model.dart`   | Data model for users.                    |
| `shared_prefs.dart` | Local storage (login state/user data).   |
| `auth_bloc.dart`    | Bloc logic for auth flows.               |
| `signin_screen.dart`| Sign-in UI with form validation.         |
| `signup_screen.dart`| Sign-up UI with password confirmation.   |
| `shopping_page.dart`| Product listings and interactive UI.     |
| `main.dart`         | App entry, theme, and routing.           |

## Dependencies
- `firebase_auth`, `firebase_core`  
- `flutter_bloc`  
- `shared_preferences`  
- `easy_localization`  

## Setup
1. Clone the repo.  
2. Run `flutter pub get`.  
3. Configure Firebase (add `google-services.json`/`GoogleService-Info.plist`).  
4. Run `flutter run`.  

---

## Output
**Screenshots**
<p align="center"><img src="https://github.com/user-attachments/assets/70e56681-7d8e-4d30-a79a-209814de78e7" alt="Login" height="844" width="431.38"/></p>
<p align="center"><img src="https://github.com/user-attachments/assets/c83a7e3f-3221-4cfa-ac13-e7913ef3f780" alt="Register" height="844" width="431.38"/></p>
<p align="center"><img src="https://github.com/user-attachments/assets/0c54a16c-6e45-4d02-8356-db4702d5cb0e" alt="Home" height="844" width="431.38"/></p>

**Video**

https://github.com/user-attachments/assets/3801652a-3195-48b7-84f9-22a49d827154

---

**Note**: Built for learning Flutter, Firebase, and state management best practices.  