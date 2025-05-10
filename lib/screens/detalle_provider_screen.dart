import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class DetalleProviderScreen extends StatelessWidget {
  const DetalleProviderScreen({super.key});
  @override
  Widget build(BuildContext context) {

    final provider = ModalRoute.of(context)!.settings.arguments as ListadoProviders;

    return Scaffold(
      appBar: AppbarName(name: 'Detalle Provider'),
      body: DetalleProvider(provider: provider),
    );
  }
}
