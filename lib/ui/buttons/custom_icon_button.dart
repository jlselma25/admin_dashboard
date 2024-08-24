

import 'package:flutter/material.dart';


class CustomIconButton extends StatelessWidget {

  final Function onPressed;
  final IconData icon;
  final String text;
  final Color color;
  final bool isFilled;

  const CustomIconButton({
     super.key, 
     required this.onPressed, 
     required this.icon, 
     required this.text, 
     this.color = Colors.indigo,
     this.isFilled = false
     });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape:WidgetStateProperty.all(const StadiumBorder()),
        backgroundColor: WidgetStateProperty.all(color.withOpacity(0.5)),
        overlayColor: WidgetStateProperty.all(color.withOpacity(0.8))
      ),
      onPressed: () => onPressed(), 
      child: Row(
        children: [
          Icon(icon,color: Colors.white,),
          
          Text(text,style: const TextStyle(color: Colors.white),)
        ],
      )
      );
  }
}