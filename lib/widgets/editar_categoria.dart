import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/categorias.dart';
import '../providers/providers.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';

class EditarCategoria extends StatelessWidget {
  final ListadoCategorias category;
  const EditarCategoria({super.key, required this.category});
  @override
  Widget build(BuildContext context) {

    final categoryService = Provider.of<CategoryService>(context);

    final categoryForm = Provider.of<CategoryFormProvider>(context);
    
    return SingleChildScrollView(
      child: Column(
        children: [
          NavBar(),
          Container(
            color: Colors.grey,
            height: 800,
            child: Center(
              child: SizedBox(
                width: 380,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Categoría', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 30),
                      Form(
                        key: categoryForm.formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: category.categoryId.toString(),
                              onChanged: (value) {
                                if (int.tryParse(value) == null) {
                                  category.categoryId = 0;
                                } else {
                                  category.categoryId = int.parse(value);
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Ingrese aquí la ID de la categoría',
                                labelText: 'ID (0 = Crear)'
                              ),
                            ),
                            TextFormField(
                              initialValue: category.categoryName,
                              onChanged: (value) => category.categoryName = value,
                              validator: (value) {
                                if (value == null || value.length <= 1) {
                                  return 'El nombre es obligatorio';
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Ingrese aquí el nombre de la categoría',
                                labelText: 'Nombre'
                              ),
                            ),
                            TextFormField(
                              initialValue: category.categoryState,
                              onChanged: (value) => category.categoryState = value,
                              validator: (value) {
                                if (value == null || value.length <= 1) {
                                  return 'El estado es obligatorio';
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Ingrese aquí el estado de la categoría',
                                labelText: 'Estado'
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FloatingActionButton(
                                  onPressed: () async {
                                    if (!categoryForm.isValidForm()) return;
                                    await categoryService.deleteCategory(categoryForm.category);
                                    Navigator.pushNamed(context, 'lista_categorias');
                                  },
                                  heroTag: null,
                                  child: Icon(Icons.delete_forever)
                                ),
                                SizedBox(width: 20),
                                FloatingActionButton(
                                  onPressed: () async {
                                    if (!categoryForm.isValidForm()) return;
                                    await categoryService.editOrCreateCategory(categoryForm.category);
                                    Navigator.pushNamed(context, 'lista_categorias');
                                  },
                                  heroTag: null,
                                  child: Icon(Icons.save)
                                )
                              ],
                            )
                          ],
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}