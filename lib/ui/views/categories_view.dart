import 'package:admn_dashboard/datatables/categories_datasource.dart';
import 'package:admn_dashboard/models/category.dart';
import 'package:admn_dashboard/providers/categories_provider.dart';
import 'package:admn_dashboard/ui/buttons/custom_icon_button.dart';

import 'package:admn_dashboard/ui/labels/custom_labels.dart';
import 'package:admn_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {

  int recordPage  = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {    
    super.initState();
     Provider.of<CategoriesProvider>(context,listen: false).getCategories();
   
  }




  @override
  Widget build(BuildContext context) {

    final categories =Provider.of<CategoriesProvider>(context).categories;
    return Container(     
      padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children:  [

          Text(categories.length.toString(),style: CustomLabel.h1,),

          const SizedBox(height: 10,),

          PaginatedDataTable(
              columns: const [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Cetegory')),
                DataColumn(label: Text('Created by')),
                DataColumn(label: Text('Actions')),             
                
              ], 
              source: CategoriesDTS(categories,context),
              header: const Text('List of Categories'),
            
               onRowsPerPageChanged:(value){
                setState(() {
                  recordPage = value ?? 10;
                });
                
              },
              rowsPerPage: recordPage,
              actions: [
                CustomIconButton(
                  onPressed: (){
                  showGeneralDialog(
                      context: context,
                      barrierDismissible: false,               
                      pageBuilder: (context, animation1, animation2) {
                        return const Align(
                          alignment: Alignment.bottomCenter,     
                            child: CateogryModal()       
                            
                        );
                      },
                   );
                  },
                  icon: Icons.add_outlined, 
                  text: 'Crear'
                  )
              ],
              
          )

        


        ],
      ),
      
    );
  }
}