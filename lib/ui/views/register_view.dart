import 'package:admn_dashboard/providers/register_from_provider.dart';
import 'package:admn_dashboard/router/router.dart';
import 'package:admn_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admn_dashboard/ui/buttons/link_text.dart';
import 'package:admn_dashboard/ui/inputs/custom_input.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(
        builder: (context){

          final registerFormProvider = Provider.of<RegisterFormProvider>(context,listen: false);
          return Container(
            margin: const EdgeInsets.only(top: 100),
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            color: Colors.black,  
            child:  Center(
              child: ConstrainedBox(
                constraints:const BoxConstraints( maxWidth: 370),
                child:  Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: registerFormProvider.keyForm,
                  child: Column(
                    children: [
          
                      TextFormField(
                        onChanged: (value) => registerFormProvider.name = value,
                        validator: (value) {    
                        
                          if(value == null || value.isEmpty || value.trim().isEmpty ) return 'El nombre es obligatorio';
          
                          return null;

                        },
                        style: const TextStyle(color: Colors.white),
                        decoration:  CustomInput.loginInputDecoration(
                          hint: 'Ingrese su nombre',
                          label: 'Nombre',
                          icon: Icons.supervised_user_circle_sharp
                        ),
                      ),
          
                      const SizedBox(height: 20,),
          
                      TextFormField(
                        onChanged: (value) => registerFormProvider.email = value,
                        validator: (value){
                          if (!EmailValidator.validate(value ?? '')) return 'Email no válido';

                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration:  CustomInput.loginInputDecoration(
                          hint: 'Ingrese su email',
                          label: 'Email',
                          icon: Icons.email_outlined
                        ),
                      ),
          
                      const SizedBox(height: 20,),
          
                      TextFormField(
                        onChanged: (value) => registerFormProvider.password = value,
                        validator: (value){
          
                          if(value == null || value.isEmpty ) return 'Ingrese su contraseña';
                          if(value.length < 6 ) return 'La contraseña debe de ser como minimo de 6 caracteres';
          
                          return null;
          
                        },
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInput.loginInputDecoration(
                          hint: '*********',
                          label: 'Contraseña',
                          icon: Icons.lock_clock_outlined
                        ),
                      ),
          
                      const SizedBox(height: 20,),
          
                      CustomOutlinedButton(
                        onPressed: (){
                          registerFormProvider.validateForm();
                        }, 
                        text: 'Crear cuenta',
                        color: Colors.yellow,
                      
                        ),
          
                      const SizedBox(height: 20,),
          
                      LinkText(
                        text: 'Ir a login',
                        onPressed: (){
                          Navigator.pushNamed(context, Flurorouter.loginRoute);
                        },
                        )
          
                    ],
                  )
                  ),
                  
                )
            ),
          );
        }
        )
    );
  }

 
}