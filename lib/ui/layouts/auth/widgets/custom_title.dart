
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                    
          Image.asset(
            'logogoku.png',
            height: 50,
            width: 50,
            ),
         const SizedBox(height: 20,),
         FittedBox(
          fit: BoxFit.contain,
           child: Text(
              'Flying Now',
              style: GoogleFonts.montserratAlternates(
                fontSize: 60,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              ),
         )
        ],
      ),
    );
  }
}