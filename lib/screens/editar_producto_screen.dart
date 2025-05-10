import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class EditarProductoScreen extends StatelessWidget {
  const EditarProductoScreen({super.key});
  @override
  Widget build(BuildContext context) {

    final product = ModalRoute.of(context)!.settings.arguments as Listado? ?? Listado(
      productId: 0,
      productName: '',
      productImage: 'https://upload.wikimedia.org/wikipedia/commons/0/0a/No-image-available.png',
      productPrice: 0,
      productState: 'Activo'
    );

    return Scaffold(
      appBar: AppbarName(name: 'Producto'),
      body: ChangeNotifierProvider(
        create: (_) => ProductFormProvider(product),
        child: EditarProducto(product: product),
      ),
    );
  }
}
