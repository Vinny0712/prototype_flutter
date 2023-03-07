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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDSEG8085mc-SqnnNeH4-KjWQqBNbLTFrk',
    appId: '1:726899281645:web:1aebf70323ff72a2c7c6e4',
    messagingSenderId: '726899281645',
    projectId: 'eldtech-sos',
    authDomain: 'eldtech-sos.firebaseapp.com',
    storageBucket: 'eldtech-sos.appspot.com',
    measurementId: 'G-BHHSNYMWFQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDePpEndG4qVq2JKB09C45e4tIPYlzTtzs',
    appId: '1:726899281645:android:962088af27e7e1d6c7c6e4',
    messagingSenderId: '726899281645',
    projectId: 'eldtech-sos',
    storageBucket: 'eldtech-sos.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyATnsDeRrbpS9RyK45NekMireENqMVN344',
    appId: '1:726899281645:ios:f38b89b0f243ed1fc7c6e4',
    messagingSenderId: '726899281645',
    projectId: 'eldtech-sos',
    storageBucket: 'eldtech-sos.appspot.com',
    iosClientId: '726899281645-q44abnmhhmrdkqk3u9lumhmh2bfoe649.apps.googleusercontent.com',
    iosBundleId: 'com.eldtech.eldtechSos',
  );
}
