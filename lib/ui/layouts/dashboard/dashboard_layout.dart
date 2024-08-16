import 'package:flutter/material.dart';



class DashboardLayout extends StatelessWidget {

  final Widget child;

  const DashboardLayout({
    super.key, 
    required this.child
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [

            const Text('Dashboard Layout',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

            Expanded(child: child)
          ],
        ),
      ),
    );
  }
}