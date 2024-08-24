import 'package:admn_dashboard/datatables/users_datasource.dart';
import 'package:admn_dashboard/providers/users_provider.dart';
import 'package:admn_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {

    final usersProvider = Provider.of<UsersProvider>(context);
    final userDataSource = UsersDTS(usersProvider.users,context);
    return Container(
      color: Colors.blue.withOpacity(0.1),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children:  [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('Users view',style: CustomLabel.h1,),
          ),

          const SizedBox(height: 10,),

          PaginatedDataTable(
            sortAscending: usersProvider.asc,
            sortColumnIndex: usersProvider.sortColumnIndex,
            columns: [
              const DataColumn(label: Text('Avatar')),             
              DataColumn(
                label: const Text('Name'),
                onSort: (colIndex, _){               
                  usersProvider.sortColumnIndex = colIndex;  
                  usersProvider.sortList(colIndex);   
                 }
              ),
              DataColumn(
                label: const Text('Email'),
                onSort: (colIndex,_){
                  usersProvider.sortColumnIndex = colIndex;  
                  usersProvider.sort((user) => user.correo);                  
                }
              ),
              const DataColumn(label: Text('ID')),
              const DataColumn(label: Text('Acciones')),
            ],
 
            source: userDataSource,
            header: const Text('List of users'),
            onPageChanged: (page){

            },
            
            )
            



        ],
      ),
      
    );
  }
}