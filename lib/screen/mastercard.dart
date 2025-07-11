import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:matajer_app/screen/home_page.dart';


class Mastercard extends StatelessWidget {
  const Mastercard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        title: Text(
          'Mastercard',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            Image.asset('assets/card.png'),
            SizedBox(height: 40),
            Cards(text: 'Number Card'),
            SizedBox(height: 24),
            Cards(text: 'Your Name'),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(child: Cards2(text: 'Month/Year')),
                  SizedBox(width: 8),
                  Expanded(child: Cards2(text: 'CVV')),
                ],
              ),
            ),
            SizedBox(height: 64),
            Padding(
              padding: const EdgeInsets.all(16.16),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Lottie.asset(
                              'assets/lottie/Animation - 1750583742906.json',
                              width: 120,
                              height: 120,
                              repeat: false,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Purchase Successful',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Your payment has been completed successfully.',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); 
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const  HomePage (),
                                ),
                              );
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xff2B70B1),
                    borderRadius: BorderRadius.circular(64),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF9E9E9E).withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Confirme',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  final String text;
  const Cards({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(64),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF9E9E9E).withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            hintText: text,
            border: InputBorder.none, 
          ),
          style: TextStyle(fontSize: 16, color: Color(0xffB0B0B0)),
        ),
      ),
    );
  }
}

class Cards2 extends StatelessWidget {
  final String text;

  const Cards2({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width / 2 - 24;

    return Container(
      width: width,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(64),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF9E9E9E).withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
        style: TextStyle(fontSize: 16, color: Color(0xffB0B0B0)),
      ),
    );
  }
}
