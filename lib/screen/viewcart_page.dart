import 'package:flutter/material.dart';
import 'package:matajer_app/screen/payment.dart';


class ViewCartPage extends StatefulWidget {
  const ViewCartPage({Key? key}) : super(key: key);

  @override
  State<ViewCartPage> createState() => _ViewCartPageState();
}

class _ViewCartPageState extends State<ViewCartPage> {
  int quantity = 1;
  double price = 1100;
  double deliveryFee = 100;

  @override
  Widget build(BuildContext context) {
    double subtotal = price * quantity;
    double total = subtotal + deliveryFee;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Cart',
          style: TextStyle(color: Color(0xFF000000), fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF000000)),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFDADADA),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/iphone.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Iphone 14 Pro Max With An Internal Memory Of 256',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '\$${price.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2B70B1),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (quantity > 1) quantity--;
                                });
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Color(0xff2B70B1),
                              ),
                            ),
                            Text(
                              quantity.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Color(0xff2B70B1),
                              ),
                            ),
                            const Spacer(),
                            TextButton.icon(
                              onPressed: () {
                              },
                              icon: const Icon(Icons.delete_outline),
                              label: const Text("Remove"),
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF9E9E9E),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              "Promocode",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(64),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.local_offer_outlined),
                  hintText: 'Enter Your Promo Code Here',
                ),
              ),
            ),
            const SizedBox(height: 40),

            const Text(
              "Delivery address",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(64),
              ),
              child: Row(
                children: const [
                  Icon(Icons.location_on_outlined, color: Color(0xFF9E9E9E)),
                  SizedBox(width: 8),
                  Expanded(child: Text('5-17 Al Gazaeli - Qesm Al Gomrok')),
                ],
              ),
            ),
            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2B70B1),
                  ),
                ),
                Text(
                  '\$${total.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2B70B1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Subtotal"),
                Text('\$${subtotal.toStringAsFixed(0)}'),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Delivery Fee"),
                Text('\$${deliveryFee.toStringAsFixed(0)}'),
              ],
            ),
            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Payment (),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2B70B1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(64),
                  ),
                ),
                child: const Text(
                  'Checkout',
                  style: TextStyle(fontSize: 16, color: Color(0xffffffff)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
