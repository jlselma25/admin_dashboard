


import 'package:admn_dashboard/api/CafeApi.dart';
import 'package:admn_dashboard/providers/auth_provider.dart';
import 'package:admn_dashboard/providers/categories_provider.dart';
import 'package:admn_dashboard/providers/sidemenu_provider.dart';
import 'package:admn_dashboard/router/router.dart';
import 'package:admn_dashboard/services/local_storage.dart';
import 'package:admn_dashboard/services/navigation_service.dart';
import 'package:admn_dashboard/services/notifications_service.dart';
import 'package:admn_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:admn_dashboard/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:admn_dashboard/ui/layouts/splash/splash_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  await LocalStorage.configurePrefs();
  CafeApi.configureDio();  
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),

        ChangeNotifierProvider(lazy: false,create:(_) => SideManuProvider()),

         ChangeNotifierProvider(create:(_) => CategoriesProvider())
      ],
      child: const MainApp()
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Admin dashboard',
      debugShowCheckedModeBanner: false,
      initialRoute: Flurorouter.rootRoute,
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      builder: (_, child){

        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.cheching){
          return const SplashLayout();
        }

        if (authProvider.authStatus == AuthStatus.authenticated){
          return DashboardLayout(child: child!);
        }    
        else{
          return AuthLayout(child: child!);
        }   
       
        
    //    
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: WidgetStateProperty.all(
            Colors.white.withOpacity(0.5)
          )
        )
      ),
    );
  }
}
