
import 'package:admn_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';


class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black,
      height: size.width > 1000 ? size.height * 0.07 : null ,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(text:'About',onPressed: () => print('About'),),
          const LinkText(text:'Help Center'),
          const LinkText(text:'Terms of service'),
          const LinkText(text:'Privacy Policy'),
          const LinkText(text:'Contact'),
          const LinkText(text:'Blog'),
          const LinkText(text:'Status'),
          const LinkText(text:'Ads Info'),
          const LinkText(text:'Careers'),
          const LinkText(text:'Brand Resources'),
          const LinkText(text:'Advertising'),
          const LinkText(text:'Marketing'),
          


        ],
      )

     
    );
    
  }
}