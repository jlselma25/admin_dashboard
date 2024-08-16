

import 'package:admn_dashboard/router/admin_handlers.dart';
import 'package:admn_dashboard/router/dashboard_handlers.dart';
import 'package:admn_dashboard/router/no_page_found_handler.dart';
import 'package:fluro/fluro.dart';

class Flurorouter{

  static final FluroRouter router = FluroRouter();
 

  static String rootRoute = '/';
  static String loginRoute = '/auth/login';
  static String loginRegister = '/auth/register';

  static String dashBoardRoute = '/dashboard';


  static void configureRoutes(){

    router.define(rootRoute, handler: AdminHandlers.login,transitionType: TransitionType.none);   
    router.define(loginRoute, handler: AdminHandlers.login,transitionType: TransitionType.none);
    router.define(loginRegister, handler: AdminHandlers.register, transitionType: TransitionType.none);

     router.define(dashBoardRoute, handler: DashboardHandlers.dashboard,transitionType: TransitionType.fadeIn);


   router.notFoundHandler = NoPageFoundHandlers.pageNotFound;

  }

}