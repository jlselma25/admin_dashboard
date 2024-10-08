

import 'package:admn_dashboard/providers/auth_provider.dart';
import 'package:admn_dashboard/ui/views/dashboard_view.dart';
import 'package:admn_dashboard/ui/views/login_view.dart';
import 'package:admn_dashboard/ui/views/register_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class AdminHandlers {

  static Handler login = Handler(
    handlerFunc: (context, params){
     
      final authProvider = Provider.of<AuthProvider>(context!);      

      if(authProvider.authStatus == AuthStatus.noAuthenticated){
        return const LoginView();
      }      
      else{
        return const DashboardView();
      }

    }
    
    );

    static Handler register = Handler(
    handlerFunc: (context, params){

      final authProvider = Provider.of<AuthProvider>(context!);

      if(authProvider.authStatus == AuthStatus.noAuthenticated){
          return const RegisterView();
      }      
      else{
        return const DashboardView();
      }
     

    }
    
    );



}