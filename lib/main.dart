import 'package:safeguide/models/content_data.dart';
import 'package:safeguide/pages/dashboard_page.dart';
import 'package:safeguide/pages/detail_page.dart';
import 'package:safeguide/pages/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/bookmark_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF9F9F9),
        textTheme: GoogleFonts.soraTextTheme(),
      ),
      home: const OnboardPage(),
      routes: {
        '/dashboard': (context) => const DashboardPage(),
        '/bookmark': (context) => const BookmarkPage(),
        '/detail': (context) {
          ContentData contentData =
              ModalRoute.of(context)!.settings.arguments as ContentData;
          return DetailPage(contentData: contentData);
        },
      },
    );
  }
}
