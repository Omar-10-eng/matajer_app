import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matajer_app/screen/About_page.dart';
import 'package:matajer_app/screen/cart2_page.dart';
import 'package:matajer_app/screen/favorite_page.dart';
import 'package:matajer_app/screen/phones.dart';
import 'package:matajer_app/screen/prize_page.dart';
import 'package:matajer_app/screen/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MainHomeContent(),
    FavoritePage(),
    PrizePage(),
    Cart2Page(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff2B70B1),
        unselectedItemColor: Theme.of(context).disabledColor,
        onTap: _onItemTapped,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icon/cup.svg',
              height: 24,
              width: 24,
              color: Theme.of(context).disabledColor,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icon/cup2.svg',
              height: 24,
              width: 24,
              color: const Color(0xff2B70B1),
            ),
            label: 'Prize',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class MainHomeContent extends StatelessWidget {
  const MainHomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      children: [
        const SizedBox(height: 24),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 56,
          child: Row(
            children: [
              // 🔍 خانة السيرش
              Expanded(
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(64),
                    boxShadow: [
                      BoxShadow(
                        color: theme.shadowColor.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      Icon(Icons.search, color: Colors.grey, size: 32),
                      const SizedBox(width: 16),
                      Text(
                        'Search Product',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // 🛒 زر الكارت
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xfffffffff),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  color: Colors.grey,
                  iconSize: 24,
                  onPressed: () {
                    print('Cart icon pressed');
                    // ممكن هنا تروح لصفحة الكارت مثلاً
                  },
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: Color(0xffEBEBEB),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hurry up to buy!',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'MacBook Pro 16',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.hintColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '25%',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: const Color(0xff2B70B1),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/offer.png',
                    width: 200,
                    height: 180,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Category',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 16),
              CategoryItem(
                image: 'assets/category/phone.png',
                text: 'Phones',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Phones()),
                ),
              ),
              const SizedBox(width: 16),
              const CategoryItem(
                image: 'assets/category/laptop.png',
                text: 'Laptop',
              ),
              const SizedBox(width: 16),
              const CategoryItem(
                image: 'assets/category/headphoens.png',
                text: 'Headphones',
              ),
              const SizedBox(width: 16),
              const CategoryItem(
                image: 'assets/category/videogame.png',
                text: 'Video Game',
              ),
              const SizedBox(width: 16),
              const CategoryItem(
                image: 'assets/category/screen.png',
                text: 'Screen',
              ),
              const SizedBox(width: 16),
              const CategoryItem(
                image: 'assets/category/camera.png',
                text: 'Cameras',
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Popular',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: const [
                  PopularItem(
                    image2: 'assets/iphpne2.png',
                    text2:
                        'iphone 13 pro max with an internal memory of 256...',
                    price: '\$850',
                  ),
                  SizedBox(width: 8),
                  PopularItem(
                    image2: 'assets/iphone.png',
                    text2:
                        'iphone 14 pro max with an internal memory of 256...',
                    price: '\$1000',
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: const [
                  PopularItem(
                    image2: 'assets/laptop1.png',
                    text2:
                        'ideapad gaming 3 laptop with 16-inch display core i7...',
                    price: '\$1200',
                  ),
                  SizedBox(width: 8),
                  PopularItem(
                    image2: 'assets/laptop3.png',
                    text2:
                        'Book Pro G9 450 HP laptop with a 15.6-inch screen...',
                    price: '\$900',
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: const [
                  PopularItem(
                    image2: 'assets/playstation5.png',
                    text2:
                        'Playstation 5 digital edition game console with controller...',
                    price: '\$1500',
                  ),
                  SizedBox(width: 8),
                  PopularItem(
                    image2: 'assets/playstation4.png',
                    text2:
                        'Playstation 4 digital edition game console with controller...',
                    price: '\$950',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback? onTap;

  const CategoryItem({
    Key? key,
    required this.image,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xffEBEBEB),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(text, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class PopularItem extends StatefulWidget {
  final String image2;
  final String text2;
  final String price;

  const PopularItem({
    Key? key,
    required this.image2,
    required this.text2,
    required this.price,
  }) : super(key: key);

  @override
  State<PopularItem> createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = (screenWidth - 16 - 16 - 8) / 2;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutPage()),
        );
      },
      child: Container(
        width: containerWidth,
        height: 300,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xffEBEBEB),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.asset(widget.image2, fit: BoxFit.contain),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    widget.text2,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.price,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff2B70B1),
                        ),
                      ),
                      Icon(
                        Icons.add_shopping_cart,
                        size: 32,
                        color: theme.iconTheme.color,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () => setState(() => isFavorited = !isFavorited),
                child: Icon(
                  isFavorited ? Icons.favorite : Icons.favorite_border,
                  color: isFavorited ? Colors.red : theme.disabledColor,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
