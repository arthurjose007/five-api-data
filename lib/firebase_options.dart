// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBf3r_qeZ-TVkvTBj8SNFdTutmAI9T7Xss',
    appId: '1:656129274302:web:b4585979cd9e6a47e189ef',
    messagingSenderId: '656129274302',
    projectId: 'socials-7f6f0',
    authDomain: 'socials-7f6f0.firebaseapp.com',
    storageBucket: 'socials-7f6f0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCN9eVWzYtYgfS8T0XnOT_lLbPPOHfM8EI',
    appId: '1:656129274302:android:f4a4d7db731be2aee189ef',
    messagingSenderId: '656129274302',
    projectId: 'socials-7f6f0',
    storageBucket: 'socials-7f6f0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBA2ET9XAvj8XGmyIvE7cjRG7PRB4rgB9Y',
    appId: '1:656129274302:ios:b070ffa011c9b749e189ef',
    messagingSenderId: '656129274302',
    projectId: 'socials-7f6f0',
    storageBucket: 'socials-7f6f0.appspot.com',
    iosBundleId: 'com.example.apidata',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBA2ET9XAvj8XGmyIvE7cjRG7PRB4rgB9Y',
    appId: '1:656129274302:ios:b070ffa011c9b749e189ef',
    messagingSenderId: '656129274302',
    projectId: 'socials-7f6f0',
    storageBucket: 'socials-7f6f0.appspot.com',
    iosBundleId: 'com.example.apidata',
  );
}
