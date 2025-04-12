import 'package:dd_grab/view/purchase_method.dart';
import 'package:dd_grab/viewmodels/cart_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view/reusable_appbar.dart'; // Add your CustomHomeAppBar here

final cartViewModelProvider = ChangeNotifierProvider((ref) => CartViewModel());

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(cartViewModelProvider);

    return Scaffold(
      body: Column(
        children: [
          const CustomHomeAppBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Bag (1 Product)",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),

                  // Product Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 2),
                      ],
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/mobile.png',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Redmi A4 5G (Starry Black, 4GB RAM, 64GB)",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              DropdownButton<int>(
                                value: vm.quantity,
                                items: List.generate(5, (index) {
                                  final qty = index + 1;
                                  return DropdownMenuItem(
                                    value: qty,
                                    child: Text("QTY $qty"),
                                  );
                                }),
                                onChanged: (value) {
                                  if (value != null) {
                                    ref
                                        .read(cartViewModelProvider)
                                        .updateQuantity(value);
                                  }
                                },
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    "₹${vm.itemPrice}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    "M.R.P. ₹11,999",
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: const [
                                  Icon(Icons.local_shipping_outlined, size: 16),
                                  SizedBox(width: 4),
                                  Text(
                                    "STANDARD Delivery by 31 Jan",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: const [
                                  Icon(Icons.refresh, size: 16),
                                  SizedBox(width: 4),
                                  Text(
                                    "7 days Return and Exchange",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.delete_outline),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Coupon Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.discount),
                          SizedBox(width: 6),
                          Text("Apply coupon"),
                        ],
                      ),
                      TextButton(onPressed: () {}, child: const Text("Select")),
                    ],
                  ),

                  const Divider(height: 32),

                  const Text(
                    "Order Payment Details",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Order Amount"),
                      Text(
                        "₹${(vm.itemPrice * vm.quantity).toStringAsFixed(2)}",
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Convenience Fee"),
                      Text("₹${vm.convenienceFee.toStringAsFixed(2)}"),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Order Total",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "₹${vm.totalAmount.toStringAsFixed(2)}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Bottom Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "₹${vm.totalAmount.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "View details",
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PurchaseMethodPage(),
                      ),
                    ); // Navigate to payment
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text(
                    "Proceed to Payment",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
