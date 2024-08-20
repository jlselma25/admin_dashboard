import 'package:admn_dashboard/ui/inputs/custom_input.dart';
import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 250,
      decoration: builBoxDecoration(),
      child: TextField(
        decoration:CustomInput.searchInputDecoration(
          hint: 'Buscar', 
          icon: Icons.search_outlined
        )
      ),
    );
  }

  BoxDecoration builBoxDecoration(){

    return  BoxDecoration(
      color: Colors.grey.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10)
    );

  }
  
}