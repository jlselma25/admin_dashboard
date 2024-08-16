import 'package:flutter/material.dart';


class SplashLayout extends StatelessWidget {
  const SplashLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: Image(
                    image: AssetImage('gokupensando.jpg'),
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            
            const SizedBox(height: 20,),
            const CircularProgressIndicator(
              color: Colors.yellow,
            ),          
            
          ],
        ),
      ),
    );
  }
}