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
    apiKey: 'AIzaSyCzospX1B1H_7KiJfm5mTWC1KgEL1aefZs',
    appId: '1:205885020375:web:aa8f56f9e0be773b9a3892',
    messagingSenderId: '205885020375',
    projectId: 'displaydht11',
    authDomain: 'displaydht11.firebaseapp.com',
    databaseURL: 'https://displaydht11-default-rtdb.firebaseio.com',
    storageBucket: 'displaydht11.appspot.com',
    measurementId: 'G-3K9NSMGYBY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZu1jO2h35SpHk_3VsrYIqmcSqL65Dq_w',
    appId: '1:205885020375:android:5649b6f5ef6861f19a3892',
    messagingSenderId: '205885020375',
    projectId: 'displaydht11',
    databaseURL: 'https://displaydht11-default-rtdb.firebaseio.com',
    storageBucket: 'displaydht11.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBx-hpFmtD_LvbKYRn9J0BPEdS1FnMZgmI',
    appId: '1:205885020375:ios:4860f1b61b4c33889a3892',
    messagingSenderId: '205885020375',
    projectId: 'displaydht11',
    databaseURL: 'https://displaydht11-default-rtdb.firebaseio.com',
    storageBucket: 'displaydht11.appspot.com',
    iosBundleId: 'com.example.ecasaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBx-hpFmtD_LvbKYRn9J0BPEdS1FnMZgmI',
    appId: '1:205885020375:ios:8387d52b5dc06a2c9a3892',
    messagingSenderId: '205885020375',
    projectId: 'displaydht11',
    databaseURL: 'https://displaydht11-default-rtdb.firebaseio.com',
    storageBucket: 'displaydht11.appspot.com',
    iosBundleId: 'com.example.ecasaApp.RunnerTests',
  );
}
