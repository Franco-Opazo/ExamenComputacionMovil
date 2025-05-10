import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class ListaCategoriasScreen extends StatelessWidget {
  const ListaCategoriasScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarName(name: 'Lista de Categorias'),
      body: ListaCategorias(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'editar_categoria'),
        heroTag: null,
        child: Icon(Icons.add)
      ),
    );
  }
}
