import 'package:flutter/material.dart';
import 'package:flutter_login/widgets/text_form.dart';

import '../providers/create_form_provider.dart';

class TextFormEmail extends StatelessWidget {
  const TextFormEmail({
    super.key,
    required this.createFormProvider,
  });

  final CreateFormProvider createFormProvider;

  @override
  Widget build(BuildContext context) {
    return TextForm(keyboardType: TextInputType.emailAddress,false,"Correo electrónico", "Ingrese su email", Icons.email, (value) {
      createFormProvider.setEmail(value);
    }, (value) {
      if (value != null) 
      {
        bool isValid = createFormProvider.checkIsEmailValid();
        if (isValid)
        {
            return null;
        }
        else
        {
           return 'El correo ingresado no es valido';
        }
      }
      else 
      {
        return null;
      }
    });
  }
}