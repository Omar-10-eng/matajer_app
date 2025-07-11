import 'package:flutter/material.dart';
import 'package:matajer_app/screen/viewcart_page.dart';



void showAddToCartBottomSheet(BuildContext context, String name, String price) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0x00000000),
    builder: (context) {
      return Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(color: const Color(0xFF000000).withOpacity(0.5)),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.3,
            maxChildSize: 0.6,
            builder: (_, controller) {
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: const Color(0xFFBDBDBD),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

              
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Color(0xFF4CAF50),
                          size: 32,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

              
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Text(
                            price,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF2196F3),
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'Cart Total',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0x89000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

          
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Color(0xFF2196F3)),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text(
                        'Continue Shopping',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ),
                    const SizedBox(height: 12),

                  
                    ElevatedButton(
                      onPressed: () {
                
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: const Color(0xFF2196F3),
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text(
                        'View Cart',
                        style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      );
    },
  );
}

class Phoness extends StatelessWidget {
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
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: SizedBox(
                width: 120,
                height: 120,
                child: Image.asset(image2, fit: BoxFit.contain),
              ),
            ),
          ),

          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              text2,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xff6C6C6C),
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Spacer(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2B70B1),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add_shopping_cart,
                    size: 32,
                    color: Color (0xff000000),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      barrierColor: Color (0xff000000).withOpacity(0.5),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF4CAF50),
                                      size: 40,
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      text2,
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
                                        borderRadius: BorderRadius.circular(12),
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
                                            price,
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
                                      onPressed: () => Navigator.pop(context),
                                      style: OutlinedButton.styleFrom(
                                        minimumSize: const Size.fromHeight(50),
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ViewCartPage(),
                                          ),
                                        );

                                  
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xff2B70B1,
                                        ),
                                        minimumSize: const Size.fromHeight(50),
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
    );
  }
}
