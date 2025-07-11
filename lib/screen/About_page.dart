import 'package:flutter/material.dart';
import 'package:matajer_app/screen/viewcart_page.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int selectedTab = 0;
  int selectedColorIndex = 0;

  final List<String> tabTitles = ['About', 'Specifications', 'Review'];

  final List<String> phoneImages = [
    'assets/colormobile/mobileblue.png',
    'assets/colormobile/mobilegreen.png',
    'assets/colormobile/mobilewhit.png',
    'assets/colormobile/mobilepink.png',
    'assets/colormobile/mobileblack.png',
  ];

  final List<Color> phoneColors = [
    Color(0xff93ABC3),
    Color(0xff4A5847),
    Color(0xffEFF0EA),
    Color(0xffE6D1B3),
    Color(0xff484743),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth - 32;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(size: 32, color: Color(0xffB0B0B0)),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(Icons.add_shopping_cart, color: Color(0xffB0B0B0)),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.favorite_border, color: Color(0xffB0B0B0)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: Image.asset(
                  phoneImages[selectedColorIndex],
                  key: ValueKey(phoneImages[selectedColorIndex]),
                  width: screenWidth * 0.7,
                  height: screenWidth * 0.7,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(phoneColors.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColorIndex = index;
                      });
                    },
                    child: CircleColor(
                      color: phoneColors[index],
                      isSelected: selectedColorIndex == index,
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  tabTitles.length,
                  (index) => buildTab(tabTitles[index], index),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: getTabContent(),
            ),
            const SizedBox(height: 64),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewCartPage()));
              },
              child: Container(
                width: containerWidth,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xff2B70B1),
                  borderRadius: BorderRadius.circular(64),
                ),
                child: const Center(
                  child: Text(
                    'Buy',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget buildTab(String title, int index) {
    final bool isSelected = index == selectedTab;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Container(
        width: title == "Specifications" ? 160 : 100,
        height: 48,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff2B70B1) : const Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(64),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget getTabContent() {
    switch (selectedTab) {
      case 0:
        return const Text(
          'iPhone 13 Pro takes a huge leap forward, bringing incredible speed to everything you do and dramatic new photo and video capabilities — all in two great sizes better battery life in iPhone at all The Pro camera system is dramatically stronger Super XDR Retina display with ProMotion. Super quick. Super smooth',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        );
      case 1:
        return Column(
          children: const [
            SpecificationsTab(
              text: 'Network',
              icon: Icons.network_cell,
              text1: 'Network',
              text2: '5g',
              text3: 'Dual Sim',
              text4: 'Nano Sim',
            ),
            SizedBox(height: 8),
            SpecificationsTab(
              text: 'Design',
              text1: 'Weight',
              text2: '203G',
              text3: 'Dimensions',
              text4: '146.7x71.5x7.65',
              icon: Icons.design_services,
            ),
            SizedBox(height: 8),
            SpecificationsTab(
              text: 'Screen',
              text1: 'Size',
              text2: '6.1 inch',
              text3: 'Screen Type',
              text4: 'Super Retina XDR OLED',
              icon: Icons.screenshot,
            ),
            SizedBox(height: 8),
            SpecificationsTab(
              text: 'Camera',
              text1: 'Back Camera',
              text2: '64mp',
              text3: 'Video',
              text4: '4k',
              icon: Icons.camera,
            ),
            SizedBox(height: 8),
            SpecificationsTab(
              text: 'Hardware',
              text1: 'Processor',
              text2: 'Apple A15 Bionic',
              text3: 'Graphics Processor',
              text4: '(5-Core Graphics)',
              icon: Icons.hardware,
            ),
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Customer Review',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.star, color: Colors.amber, size: 24),
                Icon(Icons.star, color: Colors.amber, size: 24),
                Icon(Icons.star, color: Colors.amber, size: 24),
                Icon(Icons.star, color: Colors.amber, size: 24),
                Icon(Icons.star_border, color: Colors.amber, size: 24),
                SizedBox(width: 8),
                Text('4.2 Out Of 5', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 4),
            const Text('3365 Rating', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            ...[
              ['5 Star', 0.68],
              ['4 Star', 0.17],
              ['3 Star', 0.08],
              ['2 Star', 0.03],
              ['1 Star', 0.05],
            ].map((e) {
              final label = e[0] as String;
              final percent = e[1] as double;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    SizedBox(width: 60, child: Text(label)),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: percent,
                            child: Container(
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text('${(percent * 100).round()}%'),
                  ],
                ),
              );
            }),
            const SizedBox(height: 24),
            const ReviewTile(
              userName: 'Albert Morno',
              rating: 4,
              comment:
                  'Lorem Ipsum Dolor Sit Amet Consectetur. Sit Diam Lacinia Scelerisque Accumsan. Quis Amet Convallis Aliquet Viverra Molestie Lacus. Morbi Quis Congue...',
            ),
            const Divider(height: 32),
            const ReviewTile(
              userName: 'Albert Morno',
              rating: 4,
              comment:
                  'Lorem Ipsum Dolor Sit Amet Consectetur. Sit Diam Lacinia Scelerisque Accumsan. Quis Amet Convallis Aliquet Viverra Molestie Lacus...',
            ),
          ],
        );
      default:
        return const Text('data');
    }
  }
}

// === Circle Color Widget ===
class CircleColor extends StatelessWidget {
  const CircleColor({required this.color, this.isSelected = false});
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey.shade300,
          width: isSelected ? 3 : 1,
        ),
      ),
    );
  }
}

// === SpecificationsTab Widget ===
class SpecificationsTab extends StatelessWidget {
  const SpecificationsTab({
    required this.text,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.icon,
  });

  final String text;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xffF2F2F2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(1, 2))],
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff2B70B1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
                Icon(icon, color: Colors.white),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text1, style: const TextStyle(fontSize: 16)),
                Text(text2, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text3, style: const TextStyle(fontSize: 16)),
                Text(text4, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// === ReviewTile Widget ===
class ReviewTile extends StatelessWidget {
  final String userName;
  final int rating;
  final String comment;

  const ReviewTile({
    Key? key,
    required this.userName,
    required this.rating,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage('assets/personal.png'),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(userName, style: const TextStyle(fontWeight: FontWeight.w500)),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        size: 20,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(comment, style: const TextStyle(color: Colors.black87)),
            ],
          ),
        ),
      ],
    );
  }
}
