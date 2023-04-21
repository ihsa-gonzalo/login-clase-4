import 'package:flutter/material.dart';
import 'package:flutter_login/widgets/text_form.dart';

import '../providers/create_form_provider.dart';

class TextFormPhone extends StatelessWidget {
  const TextFormPhone({
    super.key,
    required this.createFormProvider,
  });

  final CreateFormProvider createFormProvider;

  @override
  Widget build(BuildContext context) {
    return TextForm(
        keyboardType: TextInputType.phone,
        false,
        "Telefono",
        "Ingrese su telefono",
        Icons.phone, (value) {
      createFormProvider.setPhone(value);
    }, (value) {
      if (value != null) {
        return createFormProvider.checkFieldEmpty(value);
      } else {
        return null;
      }
    });
  }
}
