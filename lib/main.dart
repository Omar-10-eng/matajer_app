import 'package:flutter/material.dart';
import 'package:matajer_app/screen/logo_page.dart';
import 'theme_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp( // ← ده مهم جدًا
    options: DefaultFirebaseOptions.currentPlatform,
  );
 
  await ThemeController.loadTheme(); // تحميل الثيم المحفوظ

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeController.themeNotifier,
      builder: (context, themeMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My New Project',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeMode,
          home: const LogoPage(),
        );
      },
    );
  }
}








// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'My New Project',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffffffffff),
//       appBar: AppBar(backgroundColor: Color(0xffffffffff)),
//       body: ListView(
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 16),
//             width: double.infinity,
//             height: 56,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(64),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.3),
//                   spreadRadius: 2,
//                   blurRadius: 2,
//                   offset: Offset(1, 1),
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 SizedBox(width: 16),
//                 Icon(Icons.search, color: Color(0xff6C6C6C), size: 32),
//                 SizedBox(width: 16),
//                 Text(
//                   'Search Product',
//                   style: TextStyle(fontSize: 18, color: Color(0xff6C6C6C)),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 16),

//           SizedBox(height: 24),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Container(
//               width: double.infinity,
//               height: 180,
//               decoration: BoxDecoration(
//                 color: Color(0xffD9D9D9),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 24),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         Text(
//                           'Hurry up to buy!',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         SizedBox(height: 16),
//                         Text(
//                           'MacBook Pro 16',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Color(0xff6C6C6C),
//                           ),
//                         ),
//                         SizedBox(height: 16),
//                         Text(
//                           '25%',
//                           style: TextStyle(
//                             fontSize: 35,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xff2B70B1),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.asset(
//                       'assets/offer.png',
//                       width: 200,
//                       height: 180,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 32),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Category',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
//               ),
//             ),
//           ),
//           SizedBox(height: 16),

//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: CategoryItem(
//                       image: 'assets/category/phone.png',
//                       text: 'Phones',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const Phones(),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 CategoryItem(
//                   image: 'assets/category/laptop.png',
//                   text: 'Laptop',
//                 ),
//                 SizedBox(width: 16),
//                 CategoryItem(
//                   image: 'assets/category/headphoens.png',
//                   text: 'Headphoens',
//                 ),
//                 SizedBox(width: 16),
//                 CategoryItem(
//                   image: 'assets/category/videogame.png',
//                   text: 'Video Game',
//                 ),
//                 SizedBox(width: 16),
//                 CategoryItem(
//                   image: 'assets/category/screen.png',
//                   text: 'Screen',
//                 ),
//                 SizedBox(width: 16),
//                 CategoryItem(
//                   image: 'assets/category/camera.png',
//                   text: 'Cameras',
//                 ),
//                 SizedBox(width: 16),
//               ],
//             ),
//           ),
//           SizedBox(height: 24),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Popular',
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
//                 ),
//                 SizedBox(height: 16),

//                 Column(
//                   children: [
//                     Row(
//                       children: [
//                         PopularItem(
//                           image2: 'assets/iphpne2.png',
//                           text2:
//                               'Iphone 13 pro max with an internal memory of 256 ......',
//                           price: '\$850',
//                         ),
//                         SizedBox(width: 8),
//                         PopularItem(
//                           image2: 'assets/iphone.png',
//                           text2:
//                               'Iphone 14 pro max with an internal memory of 256 ...',
//                           price: '\$1000',
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 16),
//                     Row(
//                       children: [
//                         PopularItem(
//                           image2: 'assets/laptop1.png',
//                           text2:
//                               'ideapad Gaming 3 laptop with 16-inchDisplay core i7 ......',
//                           price: '\$1200',
//                         ),
//                         SizedBox(width: 8),
//                         PopularItem(
//                           image2: 'assets/laptop3.png',
//                           text2:
//                               'Book Pro G9 450 HP laptop with a 15.6-inch screen ......',
//                           price: '\$900',
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16),
//                 Row(
//                   children: [
//                     PopularItem(
//                       image2: 'assets/playstation5.png',
//                       text2:
//                           'Playstation 5 digital edition game console with controller',
//                       price: '\$1500',
//                     ),
//                     SizedBox(width: 8),
//                     PopularItem(
//                       image2: 'assets/playstation4.png',
//                       text2:
//                           'Playstation 4 digital edition game console with controller',
//                       price: '\$950',
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home,), label: 'Home'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite,color: Color(0xffB0B0B0),),
//             label: 'Favorite',
//           ),

//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               'assets/icon/cup.svg',
//               height: 24,
//               width: 24,
//               color: Color(0xffB0B0B0) // يمكن تخصيص اللون حسب الحاجة
//             ),
//             activeIcon: SvgPicture.asset(
//               'assets/icon/cup2.svg',
//               height: 24,
//               width: 24,
//               color: Colors.blue, // لون عند التحديد
//             ),
//             label: 'Prize',
//           ),

//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart,color: Color(0xffB0B0B0)),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.person,color: Color(0xffB0B0B0)), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }






























// class CategoryItem extends StatelessWidget {
//   final String image;
//   final String text;
//   final VoidCallback? onTap;

//   const CategoryItem({
//     Key? key,
//     required this.image,
//     required this.text,
//     this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         GestureDetector(
//           onTap: onTap,
//           child: Container(
//             width: 100,
//             height: 100,
//             decoration: BoxDecoration(
//               color: Color(0xffD9D9D9),
//               borderRadius: BorderRadius.circular(100),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Image.asset(image, fit: BoxFit.contain),
//             ),
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           text,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//         ),
//       ],
//     );
//   }
// }

// class PopularItem extends StatelessWidget {
//   final String image2;
//   final String text2;
//   final String price;

//   const PopularItem({
//     Key? key,
//     required this.image2,
//     required this.text2,
//     required this.price,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double containerWidth = (screenWidth - 16 - 16 - 8) / 2;

//     return Container(
//       width: containerWidth,
//       height: 300,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             spreadRadius: 2,
//             blurRadius: 4,
//             offset: Offset(2, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: double.infinity,
//             height: 150,
//             decoration: BoxDecoration(
//               color: Color(0xffD9D9D9),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Center(
//               child: SizedBox(
//                 width: 120,
//                 height: 120,
//                 child: Image.asset(image2, fit: BoxFit.contain),
//               ),
//             ),
//           ),

//           const SizedBox(height: 8),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: Text(
//               text2,
//               style: TextStyle(
//                 fontSize: 17,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xff6C6C6C),
//               ),
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),

//           Spacer(),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   price,
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xff2B70B1),
//                   ),
//                 ),
//                 Icon(Icons.add_shopping_cart, size: 32, color: Colors.black),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
