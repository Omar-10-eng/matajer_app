import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 250),
            Image.asset('assets/cartempty.png', width: 350, height: 350),
            SizedBox(height: 16),
            Text(
              'Your Cart is Empty ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff2B70B1),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Add Any Product',
              style: TextStyle(fontSize: 18, color: const Color(0xFF9E9E9E)),
            ),
          ],
        ),
      ),
    );
  }
}