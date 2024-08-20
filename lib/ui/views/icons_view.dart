import 'package:admn_dashboard/ui/cards/white_card.dart';
import 'package:admn_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';


class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(     
      color: Colors.red.withOpacity(0.5), 
    
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children:  [

          Text('Icons view',style: CustomLabel.h1,),

          const SizedBox(height: 10,),

          const Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            children: [

              WhiteCard(
                title:'ac_unit_outlined' ,
                width: 170,               
                child: Icon(Icons.ac_unit_outlined)
                  
              ),
              WhiteCard(
                title:'access_alarm_outlined' ,
                width: 170,
                child: Icon(Icons.access_alarm_outlined)
              ),

              WhiteCard(
                title:'access_time_filled_outlined' ,
                width: 170,
                child: Icon(Icons.access_time_filled_outlined)
              ),

              WhiteCard(
                title:'connected_tv_outlined' ,
                width: 170,
                child: Icon(Icons.connected_tv_outlined)
              ),

             WhiteCard(
                title:'wifi_1_bar_outlined' ,
                width: 170,
                child: Icon(Icons.wifi_1_bar_outlined)
              ),

              WhiteCard(
                title:'commit_rounded' ,
                width: 170,
                child: Icon(Icons.commit_rounded)
              ),

              


            ],
          )

      



        ],
      ),
      
    );
  }
}