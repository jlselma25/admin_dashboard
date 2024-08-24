import 'package:admn_dashboard/providers/sidemenu_provider.dart';
import 'package:admn_dashboard/ui/shared/navbar.dart';
import 'package:admn_dashboard/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';



class DashboardLayout extends StatefulWidget {

  final Widget child;

  const DashboardLayout({
    super.key, 
    required this.child
    });

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> with SingleTickerProviderStateMixin{

  @override
  void initState() {    
    super.initState();
    SideManuProvider.menuController = AnimationController(vsync: this,duration: const Duration(milliseconds: 300));
  }



  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: const  Color(0xffEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [
          
              if(size.width >= 700)
                const SideBar(),         
          
               Expanded(
                child: Column(
                  children: [
                    const Navbar(),
                    
                    Expanded(
                      child: widget.child,
                      )
                    
                  ],
                ),
              )
          
              //este es nuestra vista
              
            ],
          ),

          if (size.width < 700)
           AnimatedBuilder(
            animation: SideManuProvider.menuController, 
            builder: (context, _ ) =>  Stack(
              children: [

                if(SideManuProvider.isMenuOpen)
                  Opacity(
                    opacity: SideManuProvider.opacity.value,
                    child:GestureDetector(
                      onTap: () => SideManuProvider.closeMenu(),
                      child: Container(
                        width: size.width,
                        height: size.height,
                        color: Colors.black26

                      ),
                    ),
                  ),


                Transform.translate(
                  offset: Offset(SideManuProvider.movement.value, 0),
                  child: const SideBar(),

                
                )



              ],
            ) 
            )
        ],
      )
    );
  }
}