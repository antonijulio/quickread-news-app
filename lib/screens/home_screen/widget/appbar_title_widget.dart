import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            text: "Quick",
            style: GoogleFonts.poppins(
              color: Colors.red,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
            children: [
              TextSpan(
                text: "Read",
                style: GoogleFonts.poppins(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
