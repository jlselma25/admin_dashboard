

import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.green,
      child: const Center(
        child: Text('About View'),
      ),
    );
  }
}