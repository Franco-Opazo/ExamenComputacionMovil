import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class DetalleProductoScreen extends StatelessWidget {
  const DetalleProductoScreen({super.key});
  @override
  Widget build(BuildContext context) {

    final product = ModalRoute.of(context)!.settings.arguments as Listado;

    return Scaffold(
      appBar: AppbarName(name: 'Detalle Producto'),
      body: DetalleProducto(product: product),
    );
  }
}
