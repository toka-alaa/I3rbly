import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class I3rblyText extends StatelessWidget {
  const I3rblyText({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [ Colors.black ,   Colors.cyanAccent, Colors.cyan],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: Text(
        'أعربلي',
        style: GoogleFonts.arefRuqaa(
          fontSize: 60,
          fontWeight: FontWeight.bold,
          color: Color(0xFF00F5F5),

        ),
      ),
    );
  }
}
