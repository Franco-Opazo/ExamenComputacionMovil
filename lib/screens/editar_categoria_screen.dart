import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class EditarCategoriaScreen extends StatelessWidget {
  const EditarCategoriaScreen({super.key});
  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context)!.settings.arguments as ListadoCategorias? ?? ListadoCategorias(
      categoryId: 0,
      categoryName: '',
      categoryState: 'Activa'
    );

    return Scaffold(
      appBar: AppbarName(name: 'Categoría'),
      body: ChangeNotifierProvider(
        create: (_) => CategoryFormProvider(category),
        child: EditarCategoria(category: category),
      ),
    );
  }
}
