import 'package:admn_dashboard/providers/auth_provider.dart';
import 'package:admn_dashboard/providers/login_form_provider.dart';
import 'package:admn_dashboard/router/router.dart';
import 'package:admn_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admn_dashboard/ui/buttons/link_text.dart';
import 'package:admn_dashboard/ui/inputs/custom_input.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context,listen: false);

    return ChangeNotifierProvider(
      create: (_) =>   LoginFormProvider(),       
      child: Builder(
        builder: (context){

          final loginFormProvider = Provider.of<LoginFormProvider>(context,listen: false);
          return Container(
            margin: const EdgeInsets.only(top: 100),
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            color: Colors.black,
            child:  Center(
              child: ConstrainedBox(
                constraints:const BoxConstraints( maxWidth: 370),
                child:  Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: loginFormProvider.keyForm,
                  child: Column(
                    children: [
          
                      TextFormField(
                        onFieldSubmitted: (_) => onFormSubmit(loginFormProvider,authProvider),
                        validator: (value){
                          if (!EmailValidator.validate(value ?? '')) return 'Email no válido';

                          return null;
                        },                        
                        onChanged: (value) => loginFormProvider.email = value,
                        style: const TextStyle(color: Colors.white),
                        decoration:  CustomInput.loginInputDecoration(
                          hint: 'Ingrese su email',
                          label: 'Email',
                          icon: Icons.email_outlined
                        ),
                      ),
          
                      const SizedBox(height: 20,),
          
                      TextFormField(
                        onFieldSubmitted: (_) => onFormSubmit(loginFormProvider,authProvider),
                        onChanged: (value)=> loginFormProvider.password = value,
                        validator: (value){
          
                          if(value == null || value.isEmpty ) return 'Ingrese su contraseña';
                          if(value.length < 6 ) return 'La contraseña debe de ser como minimo de 6 caracteres';
          
                          return null;
          
                        },
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration:  CustomInput.loginInputDecoration(
                          hint: '*********',
                          label: 'Contraseña',
                          icon: Icons.lock_clock_outlined
                        ),
                      ),
          
                      const SizedBox(height: 20,),
          
                      CustomOutlinedButton(
                        onPressed: (){ 
                          onFormSubmit(loginFormProvider, authProvider);
                          },                        
                        text: 'Ingrese',
                        color: Colors.yellow,
                      
                        ),
          
                      const SizedBox(height: 20,),
          
                      LinkText(
                        text: 'Nueva cuenta',
                        onPressed: () {
                          Navigator.pushNamed(context, Flurorouter.loginRegister);
          
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


void onFormSubmit( loginFormProvider, AuthProvider authProvider){

  final isValid = loginFormProvider.validateForm();

  if(isValid) {
    authProvider.login(loginFormProvider.email, loginFormProvider.password);
  }
}
 
}