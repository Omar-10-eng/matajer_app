import 'package:flutter/material.dart';
import 'package:matajer_app/screen/setting_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:matajer_app/screen/start_page.dart'; // غيّر المسار لو مختلف

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back,',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Manage your account',
                  style: TextStyle(fontSize: 16, color: Color(0xFF9E9E9E)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _circleIcon(Icons.keyboard_return_sharp, 'Return'),
                const SizedBox(width: 48),
                _circleIcon(Icons.format_list_bulleted, 'Orders'),
              ],
            ),
          ),
          const SizedBox(height: 64),
          _buildMenuItem(context, Icons.favorite, 'Wishlist'),
          _buildMenuItem(context, Icons.location_on, 'Address'),
          _buildMenuItem(context, Icons.payment, 'Payment'),
          _buildMenuItem(context, Icons.notifications, 'Notification'),
          _buildMenuItem(
            context,
            Icons.settings,
            'Setting',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingPage()),
              );
            },
          ),
          _buildMenuItem(context, Icons.call, 'Contact Us'),
          const SizedBox(height: 24),

          GestureDetector(
            onTap: () async {
              await GoogleSignIn().signOut(); // تسجيل الخروج من جوجل
              await FirebaseAuth.instance.signOut(); // تسجيل الخروج من Firebase

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const StartPage()),
                (route) => false,
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Icon(
                    Icons.power_settings_new,
                    size: 32,
                    color: Color(0xFF9E9E9E),
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 18, color: Color(0xFF9E9E9E)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(64),
            boxShadow: const [
              BoxShadow(color: Color(0xFFDADADA), blurRadius: 10),
            ],
          ),
          child: Icon(icon, size: 40, color: Color(0xff2B70B1)),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title, {
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, size: 32, color: const Color(0xff2B70B1)),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFF9E9E9E),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward,
                  size: 32,
                  color: Color(0xFF9E9E9E),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 1.2,
              color: const Color(0xFF9E9E9E).withOpacity(0.4),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
