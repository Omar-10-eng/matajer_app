import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:matajer_app/screen/Adress_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = true;

  final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AdressPage()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Login failed')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildTextInput({
    required TextEditingController controller,
    required String hint,
    required String? Function(String?) validator,
    bool obscureText = false,
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        style: const TextStyle(fontSize: 16, color: Colors.black),
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(64),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(64),
            borderSide: const BorderSide(
              color: Color(0xff2B70B1),
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(64),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(64),
            borderSide: const BorderSide(color: Colors.red),
          ),
          errorStyle: const TextStyle(color: Colors.red),
          suffixIcon: isPassword
              ? Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                )
              : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth - 32;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Image.asset('assets/logo1.png', width: 200, height: 200),
                const SizedBox(height: 40),
                _buildTextInput(
                  controller: emailController,
                  hint: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                _buildTextInput(
                  controller: passwordController,
                  hint: 'Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  obscureText: _obscurePassword,
                  isPassword: true,
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: _isLoading ? null : _login,
                  child: Container(
                    width: containerWidth,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xff2B70B1),
                      borderRadius: BorderRadius.circular(64),
                    ),
                    child: Center(
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                          : const Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff2B70B1),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: const [
                      Expanded(child: Divider(thickness: 1.5, color: Colors.grey)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(child: Divider(thickness: 1.5, color: Colors.grey)),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                _buildSocialIcons(),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Don’t have an account?',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff2B70B1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Row(
        children: [
          _buildIcon('assets/soicalmedia/facebook.png'),
          const SizedBox(width: 16),
          _buildIcon('assets/soicalmedia/Symbol.svg.png'),
          const SizedBox(width: 16),
          _buildIcon('assets/soicalmedia/Apple.png'),
        ],
      ),
    );
  }

  Widget _buildIcon(String path) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(64),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          path,
          width: 40,
          height: 40,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
