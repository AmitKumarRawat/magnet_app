import 'package:flutter/material.dart';
import 'package:magnet_app/magnetapp/controller/authentication/authcontroller.dart';
import 'package:magnet_app/magnetapp/screens/myhomepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleAuthController controller = GoogleAuthController();
  bool _isLoading = false;

  Future<void> _handleGoogleLogin() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);

    final error = await controller.signInWithGoogle();

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (error == null) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const MyHomePage()));
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Google sign-in failed: $error')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 3),
              Center(
                child: Container(
                  height: 96,
                  width: 96,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.35),
                        blurRadius: 24,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.lock_outline,
                    color: Colors.white,
                    size: 44,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'Welcome to Magnet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Please login to continue',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const Spacer(flex: 2),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _handleGoogleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    disabledBackgroundColor: Colors.blue.shade300,
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: Colors.white,
                          ),
                        )
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.g_mobiledata, size: 32),
                            SizedBox(width: 6),
                            Text(
                              'Login with Google',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
