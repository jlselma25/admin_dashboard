


import 'package:admn_dashboard/providers/sidemenu_provider.dart';
import 'package:admn_dashboard/ui/views/no_page_found_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class NoPageFoundHandlers {

  static Handler pageNotFound = Handler(
    handlerFunc: (context, params){

      Provider.of<SideManuProvider>(context!, listen:false).setCurrentPageUrl('/404');
      return const PageNotFoundView();

    }
    
    );



}