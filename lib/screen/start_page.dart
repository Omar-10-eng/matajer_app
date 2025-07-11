import 'package:flutter/material.dart';
import 'package:matajer_app/screen/Adress_page.dart';
import 'package:matajer_app/screen/login_page.dart';
import 'package:matajer_app/screen/signup_page.dart';
import 'package:matajer_app/services/auth_service.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth - 32;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 200),
            Image.asset('assets/logo1.png', width: 200, height: 200),
            const SizedBox(height: 40),
            const Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 40),

            // ======= Sign Up Button (أزرق) =======
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupPage()),
                );
              },
              child: Container(
                width: containerWidth,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xff2B70B1),
                  borderRadius: BorderRadius.circular(64),
                ),
                child: const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // ======= Log In Button (أبيض بخط رمادي) =======
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: Container(
                width: containerWidth,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(64),
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1.5,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
            const Text(
              'Or Via Social Media',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 40),

            // ======= Social Icons with Border =======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Row(
                children: [
                  _buildSocialCircle('assets/soicalmedia/facebook.png'),
                  const SizedBox(width: 16),
                  _buildGoogleCircle(context, 'assets/soicalmedia/Symbol.svg.png'),

                  const SizedBox(width: 16),
                  _buildSocialCircle('assets/soicalmedia/Apple.png'),
                ],
              ),
            ),

            const SizedBox(height: 40),
            const Text(
              'Skip For Guest',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xff2B70B1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialCircle(String path) {
  return Container(
    width: 64,
    height: 64,
    decoration: BoxDecoration(
      color: const Color(0xFFF8F8F8),
      borderRadius: BorderRadius.circular(64),
      border: Border.all(
        color: Colors.grey.shade300,
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(2, 2),
        ),
      ],
    ),
    child: Center(
      child: Image.asset(
        path,
        width: 40,
        height: 40,
        fit: BoxFit.contain,
      ),
    ),
  );
}

Widget _buildGoogleCircle(BuildContext context, String path) {
  return GestureDetector(
    onTap: () async {
      final user = await AuthService.signInWithGoogle();
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AdressPage()),
        );
      }
    },
    child: _buildSocialCircle(path),
  );
}


}


