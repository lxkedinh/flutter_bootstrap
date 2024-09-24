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
    apiKey: 'AIzaSyC8O4sjeSuN21UBiIU7b1IECQrBBW40p3s',
    appId: '1:237911726409:web:a8bf01ff4bbd044680e298',
    messagingSenderId: '237911726409',
    projectId: 'flutter-bootstrap-bd00b',
    authDomain: 'flutter-bootstrap-bd00b.firebaseapp.com',
    storageBucket: 'flutter-bootstrap-bd00b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtLGa1ahHOwhmQmYZVK4uB8dO9VOcF11w',
    appId: '1:237911726409:android:902a4a8f5674dec280e298',
    messagingSenderId: '237911726409',
    projectId: 'flutter-bootstrap-bd00b',
    storageBucket: 'flutter-bootstrap-bd00b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZHhI_YAluvik809fx7LeKpoLskdxfMaA',
    appId: '1:237911726409:ios:4c44140928cd179780e298',
    messagingSenderId: '237911726409',
    projectId: 'flutter-bootstrap-bd00b',
    storageBucket: 'flutter-bootstrap-bd00b.appspot.com',
    iosBundleId: 'com.example.flutterBootstrap',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZHhI_YAluvik809fx7LeKpoLskdxfMaA',
    appId: '1:237911726409:ios:4c44140928cd179780e298',
    messagingSenderId: '237911726409',
    projectId: 'flutter-bootstrap-bd00b',
    storageBucket: 'flutter-bootstrap-bd00b.appspot.com',
    iosBundleId: 'com.example.flutterBootstrap',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC8O4sjeSuN21UBiIU7b1IECQrBBW40p3s',
    appId: '1:237911726409:web:89a7d65d4243b27480e298',
    messagingSenderId: '237911726409',
    projectId: 'flutter-bootstrap-bd00b',
    authDomain: 'flutter-bootstrap-bd00b.firebaseapp.com',
    storageBucket: 'flutter-bootstrap-bd00b.appspot.com',
  );
}