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
        return windows;
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
    apiKey: 'AIzaSyCa7f1nBQw0jnjszVsLrtnU8PVPUn5h7jk',
    appId: '1:930785033303:web:a379bb12987aac77053712',
    messagingSenderId: '930785033303',
    projectId: 'absaii',
    authDomain: 'absaii.firebaseapp.com',
    storageBucket: 'absaii.firebasestorage.app',
    measurementId: 'G-7EPNMEENC2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDIhrLfWG0KXib_oMwcfnakLx1isQpHZc',
    appId: '1:930785033303:android:ef347efc419b6af5053712',
    messagingSenderId: '930785033303',
    projectId: 'absaii',
    storageBucket: 'absaii.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA5yeB-xeDSH87rtOtbIjjNn-eL1di5lkc',
    appId: '1:930785033303:ios:042efd1d19e30039053712',
    messagingSenderId: '930785033303',
    projectId: 'absaii',
    storageBucket: 'absaii.firebasestorage.app',
    iosBundleId: 'com.example.absai',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA5yeB-xeDSH87rtOtbIjjNn-eL1di5lkc',
    appId: '1:930785033303:ios:042efd1d19e30039053712',
    messagingSenderId: '930785033303',
    projectId: 'absaii',
    storageBucket: 'absaii.firebasestorage.app',
    iosBundleId: 'com.example.absai',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCa7f1nBQw0jnjszVsLrtnU8PVPUn5h7jk',
    appId: '1:930785033303:web:5d97566b80a67a80053712',
    messagingSenderId: '930785033303',
    projectId: 'absaii',
    authDomain: 'absaii.firebaseapp.com',
    storageBucket: 'absaii.firebasestorage.app',
    measurementId: 'G-S7HSJ0QPE1',
  );
}
