import 'package:flutter/material.dart';
import 'viewcart_page.dart';

class Phones extends StatelessWidget {
  const Phones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        iconTheme: IconThemeData(size: 32),
        title: const Text(
          'Phones',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        centerTitle: true, 
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16), 
            child: IconButton(
              icon: const Icon(
                Icons.search,
                size: 32,
                color: Color(0xffB0B0B0),
              ),
              onPressed: () {
                
              },
            ),
          ),
        ],
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.filter_alt_outlined,
                        size: 32,
                        color: Color(0xffB0B0B0),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Phoness(
                  image2: 'assets/iphone.png',
                  text2: 'Iphone 14 pro maxwith an internalmemory of 256 ...',
                  price: '\$1000',
                ),
                SizedBox(width: 8),
                Phoness(
                  image2: 'assets/iphpne2.png',
                  text2: 'Iphone 13 pro maxwith an internalmemory of 256 ...',
                  price: '\$850',
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Phoness(
                  image2: 'assets/mobiles/iphone11.png',
                  text2: 'Iphone 11with an internalmemory of 128 ...',
                  price: '\$700',
                ),
                SizedBox(width: 8),
                Phoness(
                  image2: 'assets/mobiles/iphone12.png',
                  text2: 'Iphone 12 pro with an internalmemory of 256 ...',
                  price: '\$750',
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Phoness(
                  image2: 'assets/mobiles/android.png',
                  text2:
                      'Iphone 14 pro maxwith an internalmemory of 256 ......',
                  price: '\$650',
                ),
                SizedBox(width: 8),
                Phoness(
                  image2: 'assets/mobiles/android1.png',
                  text2:
                      'Iphone 14 pro maxwith an internalmemory of 256 ......',
                  price: '\$600',
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Phoness(
                  image2: 'assets/mobiles/android2.png',
                  text2:
                      'Iphone 14 pro maxwith an internalmemory of 256 ......',
                  price: '\$550',
                ),
                SizedBox(width: 8),
                Phoness(
                  image2: 'assets/mobiles/android3.png',
                  text2: 'Iphone 14 pro maxwith an internalmemory of 256 .....',
                  price: '\$500',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Phoness extends StatefulWidget {
  final String image2;
  final String text2;
  final String price;

  const Phoness({
    Key? key,
    required this.image2,
    required this.text2,
    required this.price,
  }) : super(key: key);

  @override
  State<Phoness> createState() => _PhonessState();
}

class _PhonessState extends State<Phoness> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = (screenWidth - 16 - 16 - 8) / 2;

    return Container(
      width: containerWidth,
      height: 300,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF9E9E9E).withOpacity(0.3),
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
                  color: const Color(0xffD9D9D9),
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
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6C6C6C),
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.price,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2B70B1),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.add_shopping_cart,
                        size: 32,
                        color: Color(0xFF000000),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          barrierColor: const Color(0xFF000000).withOpacity(0.5),
                          backgroundColor: const Color(0x00000000),
                          builder: (context) {
                            return DraggableScrollableSheet(
                              initialChildSize: 0.45,
                              maxChildSize: 0.6,
                              minChildSize: 0.3,
                              builder: (context, scrollController) {
                                return Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    controller: scrollController,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.check_circle,
                                          color: Color(0xFF4CAF50),
                                          size: 40,
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          widget.text2,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 20),
                                        Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFEEEEEE),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                          ),
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                widget.price,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff2B70B1),
                                                ),
                                              ),
                                              const Text(
                                                'Cart Total',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        OutlinedButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          style: OutlinedButton.styleFrom(
                                            minimumSize:
                                                const Size.fromHeight(50),
                                            side: const BorderSide(
                                              color: Color(0xff2B70B1),
                                            ),
                                          ),
                                          child: const Text(
                                            'Continue Shopping',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff2B70B1),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ViewCartPage(),
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xff2B70B1),
                                            minimumSize:
                                                const Size.fromHeight(50),
                                          ),
                                          child: const Text(
                                            'View Cart',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
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
              onTap: () {
                setState(() {
                  isFavorited = !isFavorited;
                });
              },
              child: Icon(
                isFavorited ? Icons.favorite : Icons.favorite_border,
                color: isFavorited ? const Color(0xFFF44336) : const Color(0xFF9E9E9E),
                size: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}