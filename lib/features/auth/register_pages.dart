import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPages extends StatefulWidget {
  final VoidCallback onBackToLogin;
  const RegisterPages({super.key, required this.onBackToLogin});

  @override
  State<RegisterPages> createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  // Register function
  Future<void> _register() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (!mounted) return;

      // Registration successful,
      widget.onBackToLogin();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Registration failed")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 420,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Register",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),

            // Name TextField
            TextField(
              controller: nameController,
              textInputAction: TextInputAction.next,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(),

                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),

            // Email TextField
            TextField(
              controller: emailController,
              textInputAction: TextInputAction.next,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),

            // Password TextField
            TextField(
              controller: passwordController,
              textInputAction: TextInputAction.next,
              obscureText: isPasswordHidden,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Password",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordHidden ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordHidden = !isPasswordHidden;
                    });
                  },
                ),
                hintStyle: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),

            // Confirm Password TextField
            TextField(
              controller: confirmPasswordController,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _register(),
              obscureText: isConfirmPasswordHidden,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Confirm Password",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    isConfirmPasswordHidden
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isConfirmPasswordHidden = !isConfirmPasswordHidden;
                    });
                  },
                ),
                hintStyle: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 32),

            // Register Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6366F1),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            //====back to login button====
            TextButton(
              onPressed: widget.onBackToLogin,
              child: const Text(
                "Already have an account?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
