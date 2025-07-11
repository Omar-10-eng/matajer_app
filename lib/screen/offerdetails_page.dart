import 'package:flutter/material.dart';
import 'package:matajer_app/screen/prizedetails_page.dart';
import 'package:matajer_app/screen/viewcart_page.dart';


class OfferDetails extends StatefulWidget {
  const OfferDetails({Key? key}) : super(key: key);

  @override
  State<OfferDetails> createState() => _OfferDetailsState();
}

class _OfferDetailsState extends State<OfferDetails> {
  int selectedIndex = 0;
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth - 32;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        elevation: 0,
      ),
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32),
            ToggleButtons(
              borderRadius: BorderRadius.circular(30),
              isSelected: [selectedIndex == 0, selectedIndex == 1],
              onPressed: (int index) {
                setState(() {
                  selectedIndex = index;
                });
                if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrizedetailsPage(),
                    ),
                  );
                }
              },
              selectedColor: const Color(0xff2B70B1),
              color: const Color(0xFF9E9E9E),
              fillColor: const Color(0xFFFFFFFF),
              constraints: const BoxConstraints(minHeight: 50, minWidth: 160),
              children: const [
                Text("Offer Details"),
                Text("Prize Details"),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              width: containerWidth,
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF9E9E9E).withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/iphone.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            isFavorited
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavorited ? const Color(0xFFF44336) : const Color(0xFF9E9E9E),
                            size: 32,
                          ),
                          onPressed: () {
                            setState(() {
                              isFavorited = !isFavorited;
                            });
                          },
                        ),
                        const SizedBox(width: 16),
                        const Icon(Icons.share, color: Color(0xFF9E9E9E), size: 32),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('20 Sold of 50', style: TextStyle(fontSize: 18)),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(16.16),
                  child: Text('End in 09 May', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: 20 / 50,
                  minHeight: 6,
                  backgroundColor: const Color(0xFFE0E0E0),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Color(0xff4CAF50)),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'IPhone 14 Pro Max',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '\$1100',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff2B70B1),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Super XDR Retina display 6.7-inch (diagonal) all-screen OLED display. The resolution is 2796 x 1290 pixels...',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF9E9E9E)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pro Camera System: 48MP main camera: 24mm, ƒ/1.78 aperture, second-generation optical image stabilization...',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF9E9E9E)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Built-in rechargeable lithium-ion battery. Wireless charging with MagSafe charger up to 15W...',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF9E9E9E)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ViewCartPage()),
                );
              },
              child: Container(
                width: containerWidth,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xff2B70B1),
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
                child: const Center(
                  child: Text(
                    'Add To Cart',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
