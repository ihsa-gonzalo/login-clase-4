import 'package:flutter/material.dart';
import 'package:flutter_login/providers/login_form_provider.dart';
import 'package:flutter_login/ui/input_decorations.dart';
import 'package:provider/provider.dart';

import '../../widgets/auth_background.dart';
import '../../widgets/card_container.dart';

class LoginScreen extends StatelessWidget 
{
  //no se refresca si es constante, más rendimiento
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),
              //usar margen en el cardcontainer
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: _LoginForm(),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                   Navigator.pushReplacementNamed(context, 'home');
                },
                child: const Text(
                  'Crear una nueva cuenta',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

//poner en archivo
class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
      // es la forma univoca de llamarlo dentro del arbol de widget
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            maxLength: 20,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'john.doe@gmail.com',
              labelText: 'Correo electrónico',
              prefixIcon: Icons.alternate_email_rounded,
            ),
            onChanged: (value) => loginForm.setUsuario(value),
            validator: (value) 
            {
              if (loginForm.checkIsEmailValid())
              {
                return null;
              }
              return 'El valor ingresado no es un correo valido';
            },
          ),
          const SizedBox(height: 30),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.number,
            decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Contraseña',
                prefixIcon: Icons.remove_red_eye_outlined),
            onChanged: (value) 
            {
               loginForm.setPassword(value);
            },
            validator: (value) 
            {
              if (loginForm.checkIsPasswordValid()) 
              {
                return null;
              }
              return 'La contraseña debe de ser de 8 caracteres';
            },
          ),
          const SizedBox(height: 30),
          Button(loginForm: loginForm)
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.loginForm,
  });

  final LoginFormProvider loginForm;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: loginForm.buttonColor ),
      onPressed: 
           () async
          {
               {
              FocusScope.of(context).unfocus();

              if (!loginForm.isFormValid()) return;

              await Future.delayed(const Duration(seconds: 7));

              Navigator.pushReplacementNamed(context, 'home');
            }   
          },
          
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
          child: const Text(
           'Aceptar',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
