import 'package:flutter/material.dart';
import 'package:matajer_app/screen/offerdetails_page.dart';


class PrizePage extends StatelessWidget {
  const PrizePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: ListView(
        children: [
          SizedBox(height: 64),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(64),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF9E9E9E).withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: const Row(
              children: [
                SizedBox(width: 16),
                Icon(Icons.search, color: Color(0xff6C6C6C), size: 32),
                SizedBox(width: 16),
                Text(
                  'Search Product',
                  style: TextStyle(fontSize: 18, color: Color(0xff6C6C6C)),
                ),
              ],
            ),
          ),
          SizedBox(height: 48),
          Prizes(
            text1: '20 Sold Of 50',
            text2: 'End In 09 May',
            text3: 'iphone 14 pro max',
            text4: 'Available',
            image1: 'assets/iphone.png',
            image3: 'assets/prize/watch.png',
            price: '\$1100',
            color: Color(0xff4CAF50),
            iconcolor: Color(0xff4CAF50),
            badgeColor: const Color(0xFF4CAF50).withOpacity(0.3),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OfferDetails()),
              );
            },
          ),
          SizedBox(height: 16),
          Prizes(
            text1: '22 Sold Of 50',
            text2: 'End In 10 May',
            text3: 'Playstation 5 digital',
            text4: 'Available',
            image1: 'assets/playstation5.png',
            image3: 'assets/prize/vr.png',
            price: '\$1500',
            color: Color(0xff4CAF50),
            iconcolor: Color(0xff4CAF50),
            badgeColor: const Color(0xFF4CAF50).withOpacity(0.3),
          ),
          SizedBox(height: 16),
          Prizes(
            text1: '30 Sold Of 50',
            text2: 'End In 15 May',
            text3: 'MackBook Pro m1',
            text4: 'Available',
            image1: 'assets/offer.png',
            image3: 'assets/prize/iphones.png',
            price: '\$1350',
            color: Color(0xff4CAF50),
            iconcolor: Color(0xff4CAF50),
            badgeColor: const Color(0xFF4CAF50).withOpacity(0.3),
          ),
          SizedBox(height: 16),
          Prizes(
            text1: '20 Sold Of 50',
            text2: 'draw in 15 Mar',
            text3: 'Canon Eos 80D camera',
            text4: 'Closed',
            image1: 'assets/category/camera.png',
            image3: 'assets/prize/headphoen.png',
            price: '\$950',
            color: Color(0xffE00000),
            iconcolor: Color(0xffE00000),
            badgeColor: const Color(0xFFF44336).withOpacity(0.3),
          ),
          SizedBox(height: 16),
          Prizes(
            text1: '20 Sold Of 50',
            text2: 'draw in 15 Mar',
            text3: 'Canon Eos 80D camera',
            text4: 'Closed',
            image1: 'assets/category/camera.png',
            image3: 'assets/prize/headphoen.png',
            price: '\$950',
            color: Color(0xffE00000),
            iconcolor: Color(0xffE00000),
            badgeColor: const Color(0xFFF44336).withOpacity(0.3),
          ),
          SizedBox(height: 16),
          Prizes(
            text1: '20 Sold Of 50',
            text2: 'draw in 15 Mar',
            text3: 'Canon Eos 80D camera',
            text4: 'Closed',
            image1: 'assets/category/camera.png',
            image3: 'assets/prize/headphoen.png',
            price: '\$950',
            color: Color(0xffE00000),
            iconcolor: Color(0xffE00000),
            badgeColor: const Color(0xFFF44336).withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}

class Prizes extends StatelessWidget {
  const Prizes({
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.image1,
    required this.image3,
    required this.price,
    required this.color,
    required this.iconcolor,
    required this.badgeColor,
    this.onTap,
  });

  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String image1;
  final String image3;
  final String price;
  final Color color;
  final Color iconcolor;
  final Color badgeColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF9E9E9E).withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(text1, style: TextStyle(fontSize: 16)),
                      Text(text2, style: TextStyle(fontSize: 16)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: badgeColor, 
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.circle, size: 10, color: iconcolor),
                            SizedBox(width: 4),
                            Text(
                              text4,
                              style: TextStyle(
                                color: iconcolor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
      
                  SizedBox(height: 8),
      
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: 20 / 50,
                      minHeight: 6,
                      backgroundColor: const Color(0xFFE0E0E0),
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                    ),
                  ),
      
                  SizedBox(height: 16),
      
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(image1, width: 80, height: 80),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              text3,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              price,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2B70B1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const Text(
                            "Prize",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              color: const Color(0xFFF5F5F5),
                              child: Image.asset(image3, width: 48, height: 48),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
