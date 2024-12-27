import 'package:flutter/material.dart';
import 'package:confressing_app/services/auth_services.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16.0,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(AuthServices().user?.photoURL ??
                  'https://example.com/default_profile_image.png'), // Replace with actual profile image URL
            ),
            Text(
              AuthServices().user?.displayName ??
                  'User Name', // Replace with actual user name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () async {
                  AuthServices().signOutUser();
                  Navigator.of(context).pushReplacementNamed('/login');
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.lightGreenAccent,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
