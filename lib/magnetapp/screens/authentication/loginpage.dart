import 'package:flutter/material.dart';
import 'package:magnet_app/magnetapp/controller/authentication/authcontroller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final  GoogleAuthController  controller = GoogleAuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Icon(Icons.lock, color: Colors.white, size: 50),
          ),
          SizedBox(height: 21),
          Center(
            child: Text(
              'Welcome to Magnet',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              'Please login to continue',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),

          SizedBox(height: 50),
          Center(
            child: InkWell(
              onTap: controller.signInWithGoogle,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(21),
                ),
                height: 40,
                width: 200,
                child: Center(
                  child: Text(
                    'Login with Google',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
