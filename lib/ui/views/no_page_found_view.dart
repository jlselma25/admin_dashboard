import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PageNotFoundView extends StatelessWidget {
  const PageNotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('404 - Page not Found ',
        style:GoogleFonts.roboto(
          fontSize: 50,
          fontWeight: FontWeight.bold
          )
        
        ),
      ),
    );
  }
}