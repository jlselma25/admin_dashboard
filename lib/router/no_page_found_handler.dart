


import 'package:admn_dashboard/ui/views/no_page_found_view.dart';
import 'package:fluro/fluro.dart';

class NoPageFoundHandlers {

  static Handler pageNotFound = Handler(
    handlerFunc: (context, params){
      return const PageNotFoundView();

    }
    
    );



}