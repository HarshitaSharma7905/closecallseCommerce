// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA7N8aLMBSPys_OjxfiY1Vdt9WpoI0JD-o',
    appId: '1:665142353651:web:c22c130e5dbaa5ed656186',
    messagingSenderId: '665142353651',
    projectId: 'bulkme-a2892',
    authDomain: 'bulkme-a2892.firebaseapp.com',
    storageBucket: 'bulkme-a2892.appspot.com',
    measurementId: 'G-SD1LSWL1LV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAI2iuPiPJWOqpG1PP1S89crMfrsJ5bnNs',
    appId: '1:665142353651:android:20c827021b5e5056656186',
    messagingSenderId: '665142353651',
    projectId: 'bulkme-a2892',
    storageBucket: 'bulkme-a2892.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8zou2dxm4Dipn6N3K2fDe6L5r5Y9ilzQ',
    appId: '1:665142353651:ios:05785f24a05447ae656186',
    messagingSenderId: '665142353651',
    projectId: 'bulkme-a2892',
    storageBucket: 'bulkme-a2892.appspot.com',
    iosClientId: '665142353651-4ab13rmradkfi5ep4ssbm9vl1cv0hqr4.apps.googleusercontent.com',
    iosBundleId: 'in.closecalls.closecallsecommerce',
  );
}