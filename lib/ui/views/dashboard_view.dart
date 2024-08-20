import 'package:admn_dashboard/providers/auth_provider.dart';
import 'package:admn_dashboard/ui/cards/white_card.dart';
import 'package:admn_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context,listen: false);
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children:  [

          Text('Dashboar view',style: CustomLabel.h1,),

          const SizedBox(height: 10,),

          WhiteCard(
            title: authProvider.user!.nombre,
            child: Text(authProvider.user!.correo)
          )



        ],
      ),
      
    );
  }
}