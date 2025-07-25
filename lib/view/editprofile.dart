import 'package:dd_grab/viewmodels/editprofile_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePage extends ConsumerWidget {
  final String name;
  final String lastName;
  final String username;
  final String email;
  final String phone;

  const EditProfilePage({
    super.key,
    required this.name,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(editProfileViewModelProvider);
    final screenwidth = MediaQuery.of(context).size.width;

    if (!vm.initialized) {
      vm.nameController.text = name;
      vm.lastname.text = lastName;
      vm.username.text = username;
      vm.emailController.text = email;
      vm.phoneController.text = phone;
      vm.initialized = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    _sectionTitle("Personal Details"),
                    _input(vm.nameController, "Name"),
                    _input(vm.lastname, "Last Name"),
                    _input(vm.username, "Username"),
                    _input(vm.emailController, "Email"),
                    _input(vm.phoneController, "Phone"),
                    // Row(
                    //   children: [
                    //     Expanded(child: _input(vm.cityController, "City")),
                    //     const SizedBox(width: 12),
                    //     Expanded(child: _input(vm.stateController, "State")),
                    //   ],
                    // ),
                    // _input(vm.pincodeController, "Pincode"),
                    SizedBox(
                      width: screenwidth * 0.3,
                      child: ElevatedButton(
                        onPressed:
                            vm.loading
                                ? null
                                : () async {
                                  final success = await vm.editProfile();
                                  if (success && context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Profile updated successfully!',
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  }
                                },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child:
                            vm.loading
                                ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                                : Text(
                                  "Save",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                      ),
                    ),
                    // const SizedBox(height: 20),
                    // _sectionTitle("Change Password"),
                    // _input(vm.passwordController, "Password", obscure: true),
                    // _input(
                    //   vm.passwordController,
                    //   "Confirm Password",
                    //   obscure: true,
                    // ),
                    // const SizedBox(height: 24),
                    // SizedBox(
                    //   width: screenwidth * 0.3,
                    //   child: ElevatedButton(
                    //     onPressed: vm.saveProfile,
                    //     style: ElevatedButton.styleFrom(
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(6),
                    //       ),
                    //       backgroundColor: Colors.black,
                    //       padding: const EdgeInsets.symmetric(vertical: 14),
                    //     ),
                    //     child: Text(
                    //       "Save",
                    //       style: GoogleFonts.poppins(
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.w600,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _input(
    TextEditingController controller,
    String label, {
    bool obscure = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          hintText: controller.text.isNotEmpty ? controller.text : label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
