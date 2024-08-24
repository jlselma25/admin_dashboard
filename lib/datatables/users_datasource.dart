

import 'package:admn_dashboard/models/usuario.dart';
import 'package:admn_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

class UsersDTS extends DataTableSource{


  final List<Usuario> users;
  final BuildContext context;

  UsersDTS(this.users, this.context);

  @override
  DataRow getRow(int index) {    

    const image =  Image(image:  AssetImage('no-image.jpg'),width: 35,height: 35,);
    return DataRow.byIndex(
      index: index,
      cells:  [
        const DataCell(ClipOval(child: image)),
        DataCell(Text(users[index].nombre)),
        DataCell(Text(users[index].correo)),
        DataCell(Text(users[index].uid)),
        DataCell(IconButton(
          onPressed: (){
          //  Navigator.pushReplacementNamed(context, '/dashboard/users/${users[index].uid}');
            NavigationService.replaceTo( '/dashboard/users/${users[index].uid}');
          }, 
          icon: const Icon( Icons.edit_outlined)
          )
        ),
        
      ]
      
      );
  }

  @override  
  bool get isRowCountApproximate => false;

  @override   
  int get rowCount => users.length;

  @override  
  int get selectedRowCount => 0;
  
}