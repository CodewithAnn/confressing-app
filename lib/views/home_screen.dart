import 'package:confressing_app/notifiers/bottom_navigation_notifirer.dart';
import 'package:confressing_app/utills/colors.dart';
import 'package:confressing_app/views/meeting_history.dart';
import 'package:confressing_app/views/meeting_screen.dart';
import 'package:confressing_app/views/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// The main screen of the app that contains a bottom navigation bar
/// and switches between different screens.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// List of screens to display based on the selected bottom navigation item.
  final List<Widget> screens = [
    MeetingScreen(),
    MeetingHistory(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("Meet and chat"),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBar: Consumer<BottomNavigationNotifier>(
        builder: (context, indexProvider, child) {
          return BottomNavigationBar(
            backgroundColor: inputBackground,
            selectedItemColor: const Color.fromARGB(255, 59, 171, 63),
            unselectedItemColor: Colors.black38,
            currentIndex: indexProvider.currentIndex,
            onTap: (value) {
              indexProvider.updateCurrentIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outlined),
                label: "Meeting",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: "History",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
              ),
            ],
          );
        },
      ),
      body: Consumer<BottomNavigationNotifier>(
        builder: (context, provider, child) {
          return screens[provider.currentIndex];
        },
      ),
    );
  }
}
