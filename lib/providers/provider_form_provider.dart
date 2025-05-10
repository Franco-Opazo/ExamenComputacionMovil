import 'package:flutter/material.dart';
import '../models/models.dart';

class ProviderFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  ListadoProviders provider;
  ProviderFormProvider(this.provider);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
