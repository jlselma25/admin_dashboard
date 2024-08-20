import 'package:admn_dashboard/providers/sidemenu_provider.dart';
import 'package:admn_dashboard/ui/shared/widgets/navbar_avatar.dart';
import 'package:admn_dashboard/ui/shared/widgets/notificaction_idicator.dart';
import 'package:admn_dashboard/ui/shared/widgets/search_text.dart';
import 'package:flutter/material.dart';


class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {

     final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 50,     
      decoration: builBoxDecoration(),
      child: Row(
        children: [

          //  if(size.width <= 700)  este codigo es por si queremos que en la codicion entre los dos widgets (interesante)
          //   ... [
          //      IconButton( onPressed: (){}, icon: const Icon(Icons.menu_outlined)),
          //     const SizedBox(width: 5),

          //        ],
          
          if(size.width <= 700)
            IconButton(
              onPressed: (){  
                SideManuProvider.openMenu();            
              }, 
              icon: const Icon(Icons.menu_outlined)
            ),

          const SizedBox(width: 5),
          
          if(size.width  > 390)
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 250),
              child: const SearchText(),
            ),

          const Spacer(),

          const NotificationIndicator(),

          const SizedBox(width: 10,),

         const NavbarAvatar(),

         const SizedBox(width: 10,)

      



        ],
      ),
    );
  }


  BoxDecoration builBoxDecoration() {

    return const BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10

        )
      ]
    

    );



  } 
}