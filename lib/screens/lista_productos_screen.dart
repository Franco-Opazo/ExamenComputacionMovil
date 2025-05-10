import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class ListaProductosScreen extends StatelessWidget {
  const ListaProductosScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarName(name: 'Lista de Productos'),
      body: ListaProductos(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'editar_producto'),
        heroTag: null,
        child: Icon(Icons.add)
      ),
    );
  }
}
