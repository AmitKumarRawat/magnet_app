import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:magnet_app/firebase_options.dart';
import 'package:magnet_app/magnetapp/controller/authentication/authcontroller.dart';
import 'package:magnet_app/magnetapp/screens/authentication/loginpage.dart';
import 'package:magnet_app/magnetapp/screens/myhomepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magnet',
      debugShowCheckedModeBanner: false,
      home: const _SessionGate(),
    );
  }
}

class _SessionGate extends StatefulWidget {
  const _SessionGate();

  @override
  State<_SessionGate> createState() => _SessionGateState();
}

class _SessionGateState extends State<_SessionGate> {
  final Future<bool> _hasSavedSession = GoogleAuthController()
      .hasSavedSession();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _hasSavedSession,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return snapshot.data == true ? const MyHomePage() : const LoginPage();
      },
    );
  }
}
