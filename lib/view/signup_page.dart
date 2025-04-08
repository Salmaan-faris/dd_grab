import 'package:dd_grab/viewmodels/sign_up_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(signUpViewModelProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 35),
              Image.asset('assets/images/ddgrab_icon.png', height: 60),
              const SizedBox(height: 24),
              const Text(
                'Sign up with Email',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sign up now to explore features, stay\nupdated, and enjoy seamless access!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 32),

              // Form fields
              _buildTextField(
                controller: viewModel.firstNameController,
                hint: 'First Name',
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: viewModel.lastNameController,
                hint: 'Last Name',
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: viewModel.usernameController,
                hint: 'Username',
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: viewModel.emailController,
                hint: 'Email',
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: viewModel.phoneController,
                hint: 'Phone Number',
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: viewModel.passwordController,
                hint: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: viewModel.confirmPasswordController,
                hint: 'Confirm Password',
                obscureText: true,
              ),
              const SizedBox(height: 24),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      viewModel.isLoading
                          ? null
                          : () => viewModel.signup(context, ref),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[600],
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child:
                      viewModel.isLoading
                          ? const CircularProgressIndicator(color: Colors.black)
                          : const Text(
                            'Create an account',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.yellowAccent),
          borderRadius: BorderRadius.circular(6),
        ),
        filled: true,
        fillColor: Colors.transparent,
      ),
    );
  }
}
