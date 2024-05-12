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
    apiKey: 'AIzaSyBT0BMeJBGAFEN4Kv2rbkhkeLr9VNEBS-Y',
    appId: '1:458226677669:web:85800a724a3daa6c11da4c',
    messagingSenderId: '458226677669',
    projectId: 'flutter-74035',
    authDomain: 'flutter-74035.firebaseapp.com',
    storageBucket: 'flutter-74035.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBcKatfXUZH3cBCOZi2EP_WI8U301S_KUQ',
    appId: '1:458226677669:android:ea2c9c3bd7a01c9e11da4c',
    messagingSenderId: '458226677669',
    projectId: 'flutter-74035',
    storageBucket: 'flutter-74035.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCS98am4QZRjXqpF1HYQqcCSYfh45x_tBA',
    appId: '1:458226677669:ios:c39bb8c941b216cb11da4c',
    messagingSenderId: '458226677669',
    projectId: 'flutter-74035',
    storageBucket: 'flutter-74035.appspot.com',
    iosBundleId: 'com.example.epitech',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCS98am4QZRjXqpF1HYQqcCSYfh45x_tBA',
    appId: '1:458226677669:ios:c39bb8c941b216cb11da4c',
    messagingSenderId: '458226677669',
    projectId: 'flutter-74035',
    storageBucket: 'flutter-74035.appspot.com',
    iosBundleId: 'com.example.epitech',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBT0BMeJBGAFEN4Kv2rbkhkeLr9VNEBS-Y',
    appId: '1:458226677669:web:f451ea1586cb52d111da4c',
    messagingSenderId: '458226677669',
    projectId: 'flutter-74035',
    authDomain: 'flutter-74035.firebaseapp.com',
    storageBucket: 'flutter-74035.appspot.com',
  );

}