import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class ListaProvidersScreen extends StatelessWidget {
  const ListaProvidersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarName(name: 'Lista de Providers'),
      body: ListaProviders(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'editar_provider'),
        heroTag: null,
        child: Icon(Icons.add)
      ),
    );
  }
}
