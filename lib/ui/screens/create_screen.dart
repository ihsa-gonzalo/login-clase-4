import 'package:flutter/material.dart';
import 'package:flutter_login/providers/create_form_provider.dart';
import 'package:flutter_login/widgets/card_container.dart';
import 'package:provider/provider.dart';

import '../../widgets/text_form_email.dart';
import '../../widgets/text_form_name.dart';
import '../../widgets/text_form_password.dart';
import '../../widgets/text_form_phone.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: CardContainer(
      child: ChangeNotifierProvider(
        create: (_) => CreateFormProvider(),
        child: _CreateForm(),
      ),
    )));
  }
}

class _CreateForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final createFormProvider = Provider.of<CreateFormProvider>(context);
    return Form(
      // es la forma univoca de llamarlo dentro del arbol de widget
      key: createFormProvider.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormEmail(createFormProvider: createFormProvider),
          TextFormName(createFormProvider: createFormProvider),
          TextFormPassword(createFormProvider: createFormProvider),
          TextFormPhone(createFormProvider: createFormProvider),
          SizedBox(height: 30,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: createFormProvider.buttonColor),
            onPressed: () {
              print("${createFormProvider.isFormValid()}");
              if (!createFormProvider.isFormValid()) return;
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: const Text(
                  'Registrar',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}


