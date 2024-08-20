import 'package:admn_dashboard/ui/cards/white_card.dart';
import 'package:admn_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';


class BlankView extends StatelessWidget {
  const BlankView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.withOpacity(0.3),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children:  [

          Text('Blank view',style: CustomLabel.h1,),

          const SizedBox(height: 10,),

          const WhiteCard(
            title:'Blank view ',
            child: Text('Hello wordl!!!!')
          )



        ],
      ),
      
    );
  }
}