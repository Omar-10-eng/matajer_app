import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
    apiKey: 'AIzaSyDGWDx2Eql-EA2inYgXqy3u7ygnaJ70hTs',
    appId: '1:431972680884:web:ca633581a88d7de88143e1',
    messagingSenderId: '431972680884',
    projectId: 'matajer-c3597',
    authDomain: 'matajer-c3597.firebaseapp.com',
    storageBucket: 'matajer-c3597.firebasestorage.app',
    measurementId: 'G-VQ29WZS4DN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzWvCsHamALOb0xW7Zp6kjEldn6bEwoWc',
    appId: '1:431972680884:android:ad847813aae7717e8143e1',
    messagingSenderId: '431972680884',
    projectId: 'matajer-c3597',
    storageBucket: 'matajer-c3597.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYmqJBfjDwXyqEwBMo5XTBE2SBQPihxvQ',
    appId: '1:431972680884:ios:12ecbd3e951f4e108143e1',
    messagingSenderId: '431972680884',
    projectId: 'matajer-c3597',
    storageBucket: 'matajer-c3597.firebasestorage.app',
    iosClientId: '431972680884-2uiiq1dvli52nh3carui9aitfiu1ksdi.apps.googleusercontent.com',
    iosBundleId: 'com.example.myProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDYmqJBfjDwXyqEwBMo5XTBE2SBQPihxvQ',
    appId: '1:431972680884:ios:12ecbd3e951f4e108143e1',
    messagingSenderId: '431972680884',
    projectId: 'matajer-c3597',
    storageBucket: 'matajer-c3597.firebasestorage.app',
    iosClientId: '431972680884-2uiiq1dvli52nh3carui9aitfiu1ksdi.apps.googleusercontent.com',
    iosBundleId: 'com.example.myProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDGWDx2Eql-EA2inYgXqy3u7ygnaJ70hTs',
    appId: '1:431972680884:web:84c8b3b2f9481aa58143e1',
    messagingSenderId: '431972680884',
    projectId: 'matajer-c3597',
    authDomain: 'matajer-c3597.firebaseapp.com',
    storageBucket: 'matajer-c3597.firebasestorage.app',
    measurementId: 'G-D515PTH1W8',
  );
}
