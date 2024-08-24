

import 'dart:js_interop';

import 'package:admn_dashboard/models/usuario.dart';
import 'package:admn_dashboard/providers/user_form_provider.dart';
import 'package:admn_dashboard/providers/users_provider.dart';
import 'package:admn_dashboard/services/navigation_service.dart';
import 'package:admn_dashboard/services/notifications_service.dart';
import 'package:admn_dashboard/ui/cards/white_card.dart';
import 'package:admn_dashboard/ui/inputs/custom_input.dart';
import 'package:admn_dashboard/ui/labels/custom_labels.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class UserView extends StatefulWidget {

  final String uid;

  const UserView({
    super.key, 
    required this.uid
    });

  

  @override
  State<UserView> createState() => _UserViewState();

  
}

class _UserViewState extends State<UserView> {

  Usuario? user;


  @override
  void initState() {   
    super.initState();

    final usersProvider = Provider.of<UsersProvider>(context,listen: false);
    final usersFomrProvider = Provider.of<UserFormProvider>(context,listen: false);

    usersProvider.getUserById(widget.uid).then((userDB) {

      if(userDB != null){
        user = userDB;
        usersFomrProvider.user = userDB;
      }
      else{
        NavigationService.replaceTo('/dashboard/users');
      }
      
    } );

    // usersProvider.getUserById(widget.uid).then((userDB) {
    //    setState((){ user = userDB; });
    // } );

  }

  @override
  void dispose() {    
    super.dispose();
    user = null;
    Provider.of<UserFormProvider>(context,listen: false).user = null;
  }



  @override
  Widget build(BuildContext context) {

    Provider.of<UsersProvider>(context);

    return Container(
      color: Colors.green.withOpacity(0.3),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children:  [

          Text('User view',style: CustomLabel.h1,),

          const SizedBox(height: 10,),

          if(user== null)          
          WhiteCard(            
            child: Container(
              alignment: Alignment.center,
              height: 300,
              child: const CircularProgressIndicator(),
            )
          ),

        if(user != null)
         const _UserViewBody()



        ],
      ),
      
    );
  }
}

class _UserViewBody extends StatelessWidget {
  const _UserViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(250),
          
        },
        children: const [
          TableRow(
            children: [
              _AvatarContainer(),
              _UserViewForm()
            ]
          )
        ],
      ),

    );
  }
}

class _UserViewForm extends StatelessWidget {
  const _UserViewForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final userFormProvider = Provider.of<UserFormProvider>(context);
    return WhiteCard(
      
      title: 'Informacion general ${userFormProvider.user!.correo}',
      child: Form(
        key: userFormProvider.keyForm,
        autovalidateMode: AutovalidateMode.always,
        child: Column(          
          children: [
            TextFormField(
              initialValue: userFormProvider.user!.nombre,
              onChanged: (value) {
                userFormProvider.user!.nombre = value;
                userFormProvider.updateListener();
              },
              decoration: CustomInput.formInputDecoration(
                hint: 'Nombre ususario',
                icon: Icons.supervised_user_circle, 
                label: 'Nombre'),
              validator: (value) {

                if(value == null || value.isEmpty) return 'Nombre es obligatorio';
                if(value.length < 2 ) return 'Email no válido';

                return null;

              },
            ),
            
            const SizedBox(height: 20,),

            TextFormField(
              initialValue: userFormProvider.user!.correo,
              onChanged: (value) {
                userFormProvider.user!.correo = value;
                userFormProvider.updateListener();
              },
              decoration: CustomInput.formInputDecoration(
                hint: 'Correo ususario',
                icon: Icons.mark_email_read_outlined,
                label: 'Correo'),
              validator: (value) {
                if (!EmailValidator.validate(value ?? '')) return 'Email no válido';

                return null;
              },
            ),

            const SizedBox(height: 20,),

            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 140),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.indigo),
                  shadowColor:WidgetStateProperty.all(Colors.transparent),
                ),
                onPressed: ()async{
                  final saved = await userFormProvider.updateUser();
                  if(saved){
                    NotificationsService.showSnackBar('Usuario actualizado');
                    Provider.of<UsersProvider>(context,listen: false).refreshUser(userFormProvider.user!);
                  }
                  else{
                    NotificationsService.showSnackBar('No se puedo actualizar');
                  }
                }, 
                child: const Row(
                  children: [
                    Icon(Icons.save_outlined,color: Colors.white,size: 22,),
                    SizedBox(width: 10,),
                    Text('Guardar',style: TextStyle(color: Colors.white),)
                  ],
                )
              )
              ,
            )
            



          ],
        )
      )
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  const _AvatarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final userFormProvider = Provider.of<UserFormProvider>(context);
   
    return WhiteCard(
       child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile',style: CustomLabel.h2,),

            const SizedBox(height: 20,),

            Container(
              width: 150,
              height: 160,
              child:  Stack(
                children: [
                  const ClipOval(
                    child: Image(image: AssetImage('no-image.jpg')
                    )
                    ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration:  BoxDecoration(                        
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white,width: 5),                        
                      ),
                      child: FloatingActionButton(
                        backgroundColor: Colors.indigo,
                        elevation: 0,
                        onPressed: (){},
                        child: const  Icon(Icons.camera_alt_outlined,color: Colors.white,),
                        ),
                    ),
                  )
                ],
              )
            ),

            const SizedBox(height: 20,),

            Text(
              userFormProvider.user!.nombre, 
              style: const TextStyle(fontWeight: FontWeight.bold,),
              textAlign: TextAlign.center,
              
              )

          ],
        ),

       )    
    );
  }
}