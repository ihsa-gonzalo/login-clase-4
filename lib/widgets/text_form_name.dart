import 'package:flutter/material.dart';
import 'package:flutter_login/widgets/text_form.dart';

import '../providers/create_form_provider.dart';

class TextFormName extends StatelessWidget {
  const TextFormName({
    super.key,
    required this.createFormProvider,
  });

  final CreateFormProvider createFormProvider;

  @override
  Widget build(BuildContext context) {
    return TextForm(false,"Nombre", "Ingrese su nombre", Icons.person, (value) {
      createFormProvider.setName(value);
    }, (value) {
      if (value != null) {
        return createFormProvider.checkFieldEmpty(value);
      } else {
        return null;
      }
    });
  }
}