import 'package:flutter/material.dart';
import 'offerdetails_page.dart';

class PrizedetailsPage extends StatefulWidget {
  const PrizedetailsPage({Key? key}) : super(key: key);

  @override
  State<PrizedetailsPage> createState() => _PrizedetailsPageState();
}

class _PrizedetailsPageState extends State<PrizedetailsPage> {
  int selectedIndex = 1;     

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth - 32;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          ToggleButtons(
            borderRadius: BorderRadius.circular(30),
            isSelected: [selectedIndex == 0, selectedIndex == 1],
            onPressed: (int index) {
              setState(() {
                selectedIndex = index;
              });
              if (index == 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OfferDetails(),
                  ),
                );
              }
            },
            selectedColor: Color (0xff2B70B1),
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
                      'assets/prize/watch.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Row(
                      children: const [
                        Icon(Icons.favorite_border, color: Color(0xFF9E9E9E), size: 32),
                        SizedBox(width: 16),
                        Icon(Icons.share, color: Color(0xFF9E9E9E), size: 32),
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
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff4CAF50)),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Apple Watch SE ',
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
                  'Prize',
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
                  'wallet app. Store boarding passes, movie tickets or rewards cards for easy access.5...',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Color(0xFF9E9E9E)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'the noise. The Noise app alerts you when the noise levels around you reach levels th...',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Color(0xFF9E9E9E)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Camera remote. Use your Apple Watch as the viewfinder for your iPhone camera. So you ca...',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Color(0xFF9E9E9E)),
                ),
              ),
            ),
            const SizedBox(height: 24),
           const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Find devices, people, and things. Locate your devices or get an alert when you leave your...',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Color(0xFF9E9E9E)),
                ),
              ),
            ),
            
          ],
        ),
      );
    
  }
}



          
        