import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class DetalleCategoriaScreen extends StatelessWidget {
  const DetalleCategoriaScreen({super.key});
  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context)!.settings.arguments as ListadoCategorias;

    return Scaffold(
      appBar: AppbarName(name: 'Detalle Categoría'),
      body: DetalleCategoria(category: category),
    );
  }
}
