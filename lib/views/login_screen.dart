import 'package:confressing_app/services/auth_services.dart';
import 'package:confressing_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthServices _authServices = AuthServices();
  void _navigateToHome() {
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
              child: Text(""" Start or Join A meeting  """,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
          ),
          CustomElevatedButton(
              text: "Login",
              onPressed: () async {
                bool response = await _authServices.signInWithGoogle(context);
                if (response && mounted) {
                  _navigateToHome();
                }
              })
        ],
      ),
    );
  }
}
