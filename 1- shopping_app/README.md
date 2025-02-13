# Flutter Auth & Shopping App

A Flutter app with **Firebase Authentication**, **Bloc state management**, **local storage**, **biometric authentication**, and a **shopping interface**.  Users can register, log in, browse products, and view their profile.

## Key Features
- **Authentication**:  
  - Firebase-powered registration/login with error handling.  
  - Login state persistence via `SharedPreferences`.  
- **State Management**:  
  - Bloc pattern for handling auth states (`AuthBloc`, `AuthEvent`, `AuthState`).  
- **Profile Management**:  
  - View user profile with name and email.  
  - Biometric authentication (fingerprint) for secure access.
- **Shopping Page**:  
  - Product carousels, grids, and hot offers.  
  - Responsive UI with `SizeConfig` for screen adaptation.  
- **Localization**:  
  - Supports English and Arabic via `EasyLocalization`.  

## Updated Features
- **Biometric Authentication**:  
  - Users can securely access their profile using fingerprint or face ID.  
  - Fallback to regular navigation if biometrics are unavailable.  
- **Profile Screen**:  
  - Displays user name and email stored in `SharedPreferences`. 

## Used Permissions
- `<uses-permission android:name="android.permission.USE_BIOMETRIC" />`
- `<uses-permission android:name="android.permission.USE_FINGERPRINT" />`

## Meta-Data
- `<meta-data
            android:name="androidx.biometric.BiometricManager.Authenticators"
            android:value="BIOMETRIC_STRONG | DEVICE_CREDENTIAL" />`

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
| `profile.dart`      | Profile UI with user details.            |
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

https://github.com/user-attachments/assets/bb16ee55-07d8-451e-8c90-e02e2693708f

---

**Note**: Built for learning Flutter, Firebase, and state management best practices.  
