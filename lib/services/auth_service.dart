import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      // تهيئة GoogleSignIn
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );

      // تسجيل خروج من أي حساب سابق
      await googleSignIn.signOut();

      // تسجيل دخول جديد
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;

      // الحصول على بيانات المصادقة من Google
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // إنشاء بيانات اعتماد Firebase
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // تسجيل الدخول باستخدام Firebase
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print('Google Sign-In Error: $e');
      return null;
    }
  }
}
