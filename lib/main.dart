import 'package:confressing_app/firebase_options.dart';
import 'package:confressing_app/notifiers/bottom_navigation_notifirer.dart';
import 'package:confressing_app/notifiers/mute_notifier.dart';
import 'package:confressing_app/services/auth_services.dart';
import 'package:confressing_app/utills/colors.dart';
import 'package:confressing_app/views/home_screen.dart';
import 'package:confressing_app/views/join_meeting_screen.dart';
import 'package:confressing_app/views/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavigationNotifier()),
        ChangeNotifierProvider(create: (context) => MuteNotifier())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: backgroundColor,
            primaryColor: Colors.green),
        debugShowCheckedModeBanner: false,
        routes: {
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
          '/join-meeting': (context) => const JoinMeetingScreen(),
        },
        home: StreamBuilder(
          stream: AuthServices().authChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return const HomeScreen();
            }
            return const LoginScreen();
          },
        ));
  }
}
