import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonRounded extends StatelessWidget {
  String title;
  String route;
  int id;
  ButtonRounded(
      {super.key, required this.title, required this.route, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(route, extra: id);
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF00337C),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
