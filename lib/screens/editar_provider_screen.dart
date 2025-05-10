import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class EditarProviderScreen extends StatelessWidget {
  const EditarProviderScreen({super.key});
  @override
  Widget build(BuildContext context) {

    final provider = ModalRoute.of(context)!.settings.arguments as ListadoProviders? ?? ListadoProviders(
      providerId: 0,
      providerName: '',
      providerLastName: '',
      providerMail: '',
      providerState: 'Activo'
    );

    return Scaffold(
      appBar: AppbarName(name: 'Provider'),
      body: ChangeNotifierProvider(
        create: (_) => ProviderFormProvider(provider),
        child: EditarProvider(provider: provider),
      ),
    );
  }
}
