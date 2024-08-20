

import 'package:admn_dashboard/providers/auth_provider.dart';
import 'package:admn_dashboard/providers/sidemenu_provider.dart';
import 'package:admn_dashboard/router/router.dart';
import 'package:admn_dashboard/ui/views/blank_view.dart';
import 'package:admn_dashboard/ui/views/dashboard_view.dart';
import 'package:admn_dashboard/ui/views/icons_view.dart';
import 'package:admn_dashboard/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {

  static Handler dashboard = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!, listen: false);
      Provider.of<SideManuProvider>(context,listen: false).setCurrentPageUrl(Flurorouter.dashBoardRoute);

      if(authProvider.authStatus == AuthStatus.authenticated){
         return const DashboardView();
      }      
      else{
        return const LoginView();
      }
    });


    static Handler icons = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!, listen: false);
      Provider.of<SideManuProvider>(context,listen: false).setCurrentPageUrl(Flurorouter.iconsRoute);

      if(authProvider.authStatus == AuthStatus.authenticated){
         return const IconsView();
      }      
      else{
        return const LoginView();
      }
    });


    static Handler blank = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!, listen: false);
      Provider.of<SideManuProvider>(context,listen: false).setCurrentPageUrl(Flurorouter.blankRoute);

      if(authProvider.authStatus == AuthStatus.authenticated){
         return const BlankView();
      }      
      else{
        return const LoginView();
      }
    });



    

    



}