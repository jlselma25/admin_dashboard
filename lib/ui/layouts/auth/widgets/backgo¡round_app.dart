

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackgroundApp extends StatelessWidget {
  const BackgroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                decoration: buildBoxDecoration(),
                constraints: const BoxConstraints(maxWidth: 400),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Image(
                      image: AssetImage('gokuvolador.png'),
                      width: 400,
                      ),
                  ),
                ),

                );
            
  }

  BoxDecoration buildBoxDecoration() {

    return const BoxDecoration(

      image: DecorationImage(
        image: AssetImage('fondo.jpg'),
        fit: BoxFit.cover

      )
    );
  }
}