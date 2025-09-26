import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyATa0zoYbxvpwmJMiklaH9pUmirRo-d-lU",
            authDomain: "smart-chat-pd.firebaseapp.com",
            projectId: "smart-chat-pd",
            storageBucket: "smart-chat-pd.firebasestorage.app",
            messagingSenderId: "602066542171",
            appId: "1:602066542171:web:63e58b3fc66f6a6c60a97e",
            measurementId: "G-DDT20HQGJJ"));
  } else {
    await Firebase.initializeApp();
  }
}
