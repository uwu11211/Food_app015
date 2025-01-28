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
    apiKey: 'AIzaSyCjNNqT5hmW-dwA0D-tYno4lvthOSZVlBc',
    appId: '1:358672810292:web:0d883af6805436aa20a561',
    messagingSenderId: '358672810292',
    projectId: 'auu007-95a70',
    authDomain: 'auu007-95a70.firebaseapp.com',
    storageBucket: 'auu007-95a70.firebasestorage.app',
    measurementId: 'G-PG6YF2RYE3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIRxCJs-vg1EYbd-i91IbK3bsFHGBYKj4',
    appId: '1:358672810292:android:426ff4a9a942030c20a561',
    messagingSenderId: '358672810292',
    projectId: 'auu007-95a70',
    storageBucket: 'auu007-95a70.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4Sb9EF5BuPe9Beu1Bs4N0GVJAB4XrDs0',
    appId: '1:358672810292:ios:1575fc5bcd67fd5320a561',
    messagingSenderId: '358672810292',
    projectId: 'auu007-95a70',
    storageBucket: 'auu007-95a70.firebasestorage.app',
    iosBundleId: 'com.example.flutterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4Sb9EF5BuPe9Beu1Bs4N0GVJAB4XrDs0',
    appId: '1:358672810292:ios:1575fc5bcd67fd5320a561',
    messagingSenderId: '358672810292',
    projectId: 'auu007-95a70',
    storageBucket: 'auu007-95a70.firebasestorage.app',
    iosBundleId: 'com.example.flutterApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBv1uCyn8SjTR8sZu7WMGESCx3wBKqXRLw',
    appId: '1:358672810292:web:3536eaf45920825320a561',
    messagingSenderId: '358672810292',
    projectId: 'auu007-95a70',
    authDomain: 'auu007-95a70.firebaseapp.com',
    storageBucket: 'auu007-95a70.firebasestorage.app',
    measurementId: 'G-2YV1YGQ3H7',
  );

}