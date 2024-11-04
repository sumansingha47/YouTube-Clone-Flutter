import 'package:flutter/material.dart';
import 'package:youtube_clone_fcc_2024/features/auth/pages/logout_page.dart';
import 'package:youtube_clone_fcc_2024/features/content/Long_video/widgets/long_video_screen.dart';
import 'package:youtube_clone_fcc_2024/features/content/short_video/pages/short_video_page.dart';
import 'package:youtube_clone_fcc_2024/features/search/pages/search_screen.dart';

const pages = [
  LongVideoScreen(),
  ShortVideoPage(),
  Center(
    child: Text("upload"),
  ),
  SearchScreen(),
  LogoutPage(),
];
