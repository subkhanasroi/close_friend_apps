import 'package:close_friend_apps/common/color.dart';
import 'package:close_friend_apps/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CloseFriend extends StatelessWidget {
  const CloseFriend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Close Friend Apps',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          scaffoldBackgroundColor: hBgColor2,
        ),
        home: const HomePage());
  }
}
