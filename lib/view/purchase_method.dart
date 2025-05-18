import 'package:dd_grab/view/debitcard.dart';
import 'package:dd_grab/view/simpleappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../viewmodels/purchase_vm.dart';

class PurchaseMethodPage extends ConsumerWidget {
  const PurchaseMethodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPayment = ref.watch(selectedPaymentProvider);

    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed:
                selectedPayment != null
                    ? () {
                      if (selectedPayment == "Debit Card") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DebitCardPage(),
                          ),
                        );
                      }
                    }
                    : null,
            child: Text(
              'Pay ₹9,499.00 Securely',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SimpleAppBar(), // ⬅️ Added here
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Purchase",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "User Information",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _infoRow("Email", "delightinter@gmail.com"),
          _infoRow("Name", "Delight Benedict"),
          _infoRow("Expected Delivery", "31 Jan, 2024"),
          _infoRow("Amount Payable", "₹9,499.00"),
          const Divider(height: 32, thickness: .5),
          _paymentOption(ref, "UPI"),
          _paymentOption(ref, "Debit Card"),
          _paymentOption(ref, "Net Banking"),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w400)),
          Text(value, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _paymentOption(WidgetRef ref, String title) {
    final selected = ref.watch(selectedPaymentProvider);

    // Function to map payment titles to respective image assets
    String getIconPath(String title) {
      switch (title) {
        case 'UPI':
          return 'assets/images/upi-icon.png'; // Make sure this exists
        case 'Debit Card':
          return 'assets/images/card.png';
        case 'Net Banking':
          return 'assets/images/bank.png';
        default:
          return 'assets/images/plus.png';
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(
            getIconPath(title),
            width: 28,
            height: 28,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.poppins(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add_circle_rounded,
              color: selected == title ? Colors.green : Colors.grey,
            ),
            onPressed: () {
              if (selected == title) {
                ref.read(selectedPaymentProvider.notifier).state = null;
              } else {
                ref.read(selectedPaymentProvider.notifier).state = title;
              }
            },
          ),
        ],
      ),
    );
  }
}
