import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone_fcc_2024/cores/screens/loader.dart';
import 'package:youtube_clone_fcc_2024/features/auth/pages/username_page.dart';
import 'package:youtube_clone_fcc_2024/features/channel/my_channel/pages/channel_settings.dart';
import 'package:youtube_clone_fcc_2024/features/channel/my_channel/pages/my_channel_screen.dart';
import 'package:youtube_clone_fcc_2024/features/channel/users_channel/pages/user_channel_page.dart';
import 'package:youtube_clone_fcc_2024/features/upload/long_video/video_details_page.dart';
import 'package:youtube_clone_fcc_2024/home_page.dart';
import 'package:youtube_clone_fcc_2024/features/auth/pages/login_page.dart';
import 'package:youtube_clone_fcc_2024/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoginPage();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }

          return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              final user = FirebaseAuth.instance.currentUser;
              if (!snapshot.hasData || !snapshot.data!.exists) {
                return UsernamePage(
                  displayName: user!.displayName!,
                  profilePic: user.photoURL!,
                  email: user.email!,
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loader();
              }

              return HomePage();
            },
          );
        },
      ),
    );
  }
}
