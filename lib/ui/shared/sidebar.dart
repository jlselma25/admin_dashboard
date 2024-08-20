import 'package:admn_dashboard/providers/auth_provider.dart';
import 'package:admn_dashboard/providers/sidemenu_provider.dart';
import 'package:admn_dashboard/router/router.dart';
import 'package:admn_dashboard/services/navigation_service.dart';
import 'package:admn_dashboard/ui/shared/widgets/logo.dart';
import 'package:admn_dashboard/ui/shared/widgets/menu_item.dart';
import 'package:admn_dashboard/ui/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SideBar extends StatelessWidget {
  const SideBar({super.key});

  void navigateTo(String routeName){

    NavigationService.navigateTo(routeName);
    SideManuProvider.closeMenu();
    
   }

  @override
  Widget build(BuildContext context) {

    final sideMenuProvider = Provider.of<SideManuProvider>(context);
    return Container(
      width: 200,
      height: double.infinity,
      decoration: boxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children:  [

          const Logo(),

          const SizedBox(height: 50,),

          const TextSeparator(text:'main'),

          MenuItem(
            text: 'Dashboard', 
            isActive: sideMenuProvider.currentPage == Flurorouter.dashBoardRoute,
            icon: Icons.compass_calibration_outlined, 
            onPreseed: () => navigateTo(Flurorouter.dashBoardRoute)),             

          MenuItem(
            text: 'Orders', icon: Icons.shopping_bag_outlined, 
            onPreseed: () => navigateTo(Flurorouter.iconsRoute)),

          MenuItem( text: 'Analytics', icon: Icons.show_chart_outlined,  onPreseed: () {} ),
          MenuItem(text: 'Categories', icon: Icons.layers_outlined, onPreseed: () {} ),
          MenuItem(text: 'Products', icon: Icons.dashboard_outlined, onPreseed: () {}),
          MenuItem(text: 'Discount', icon: Icons.attach_money_outlined, onPreseed: () {}),
          MenuItem( text: 'Customers', icon: Icons.people_alt_outlined, onPreseed: () {}),

          const SizedBox(height: 30,),

          const TextSeparator(text:'UI Elements'),

          MenuItem( 
            text: 'Icons', 
            isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
            icon: Icons.list_alt_outlined, onPreseed: () {
             NavigationService.navigateTo(Flurorouter.iconsRoute);
             SideManuProvider.closeMenu();

          }),
          MenuItem( text: 'Marketing', icon: Icons.mark_email_read_outlined, onPreseed: () {}),
          MenuItem( text: 'Compaign', icon: Icons.note_add_outlined, onPreseed: () {}),
          MenuItem( 
            text: 'Blank', 
            isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
            icon: Icons.post_add_outlined, 
            onPreseed: () => navigateTo(Flurorouter.blankRoute)
            ), 

          const SizedBox(height: 30,),

          const TextSeparator(text:'Exit'),

          MenuItem( 
            text: 'Logout', 
            icon: Icons.exit_to_app_outlined, 
            onPreseed: () {
              Provider.of<AuthProvider>(context,listen: false).logOut();
            }
            ),
          

         









        ],

      ),
    );
  }

  BoxDecoration boxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xff092044),
          Color(0xff092042),
        ]        
        ),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10
        )
      ]
    );
  }
}