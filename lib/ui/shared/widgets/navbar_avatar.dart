import 'package:flutter/material.dart';



class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {

   
    return Container(
      width: 40,
      height: 40,      
      
        child:  const Stack(
        
          children: [
             ClipOval(
               child: Image(
                     image: AssetImage('fondoavatar.jpg'),         
                     fit: BoxFit.cover,
                ),
             ),
             
              Positioned(
                left: 2,
                bottom: 2,
               
                child: ClipOval(
                  child: Image(
                        image: AssetImage('avatar.jpg'),     
                        width: 36,    
                        height: 36,
                       fit: BoxFit.cover,
                    ),
                ),
              ),
              
        
          ]
            
        ),
      
      );
    
  }
}