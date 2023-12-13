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
    apiKey: 'AIzaSyAOoe0BiIc5c4YSV6zUh6P1SeGOMdKoAmo',
    appId: '1:815226150363:web:3f018cbaf3d86d7e399bfe',
    messagingSenderId: '815226150363',
    projectId: 'my-heart-rate',
    authDomain: 'my-heart-rate.firebaseapp.com',
    databaseURL: 'https://my-heart-rate-default-rtdb.firebaseio.com',
    storageBucket: 'my-heart-rate.appspot.com',
    measurementId: 'G-R54MTYWTLP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDh71tIo2-Xj1QGM53JyOGY1f2wLcjBuWE',
    appId: '1:815226150363:android:a6836fc1ea71545e399bfe',
    messagingSenderId: '815226150363',
    projectId: 'my-heart-rate',
    databaseURL: 'https://my-heart-rate-default-rtdb.firebaseio.com',
    storageBucket: 'my-heart-rate.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcPyFoZs8_OHT7iSi6Ge_xWKxOpTI_GIE',
    appId: '1:815226150363:ios:8c23804b5b50a115399bfe',
    messagingSenderId: '815226150363',
    projectId: 'my-heart-rate',
    databaseURL: 'https://my-heart-rate-default-rtdb.firebaseio.com',
    storageBucket: 'my-heart-rate.appspot.com',
    iosBundleId: 'com.example.myHeart',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBcPyFoZs8_OHT7iSi6Ge_xWKxOpTI_GIE',
    appId: '1:815226150363:ios:4d5623f1ea155f7b399bfe',
    messagingSenderId: '815226150363',
    projectId: 'my-heart-rate',
    databaseURL: 'https://my-heart-rate-default-rtdb.firebaseio.com',
    storageBucket: 'my-heart-rate.appspot.com',
    iosBundleId: 'com.example.myHeart.RunnerTests',
  );
}
