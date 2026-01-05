import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDSKMWlkCIYip8bOyiPzd1w8HICXD7UGss",
            authDomain: "kailash-e332jc.firebaseapp.com",
            projectId: "kailash-e332jc",
            storageBucket: "kailash-e332jc.firebasestorage.app",
            messagingSenderId: "775886134123",
            appId: "1:775886134123:web:5c9f12326b4325147f4a2e"));
  } else {
    await Firebase.initializeApp();
  }
}
