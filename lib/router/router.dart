

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

  static String iconsRoute= '/dashboard/icons';
  static String blankRoute= '/dashboard/blank';
  static String categoriesRoute= '/dashboard/categories';

  static String usersRoute= '/dashboard/users';
   static String userRoute= '/dashboard/users/:uid';




 static void configureRoutes(){
 

    router.define(rootRoute, handler: AdminHandlers.login,transitionType: TransitionType.none);   
    router.define(loginRoute, handler: AdminHandlers.login,transitionType: TransitionType.none);
    router.define(loginRegister, handler: AdminHandlers.register, transitionType: TransitionType.none);

    router.define(dashBoardRoute, handler: DashboardHandlers.dashboard,transitionType: TransitionType.none);
    router.define(iconsRoute, handler: DashboardHandlers.icons,transitionType: TransitionType.none);
    router.define(blankRoute, handler: DashboardHandlers.blank,transitionType: TransitionType.none);
    router.define(categoriesRoute, handler: DashboardHandlers.categories,transitionType: TransitionType.none);
    router.define(usersRoute, handler: DashboardHandlers.users,transitionType: TransitionType.none);
    router.define(userRoute, handler: DashboardHandlers.user,transitionType: TransitionType.none);




   router.notFoundHandler = NoPageFoundHandlers.pageNotFound;

  }

}