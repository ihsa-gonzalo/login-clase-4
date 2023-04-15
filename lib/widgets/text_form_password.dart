import 'package:flutter/material.dart';
import 'package:flutter_login/widgets/text_form.dart';

import '../providers/create_form_provider.dart';

class TextFormPassword extends StatelessWidget {
  const TextFormPassword({
    super.key,
    required this.createFormProvider,
  });

  final CreateFormProvider createFormProvider;

  @override
  Widget build(BuildContext context) {
    return TextForm(true,"Contraseña", "Ingrese su contraseña", Icons.lock, (value) {
      createFormProvider.setPassword(value);
    }, (value) {
      if (value != null) {
        return createFormProvider.checkFieldEmpty(value);
      } else {
        return null;
      }
    });
  }
}
