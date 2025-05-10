import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/productos.dart';
import '../providers/providers.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';

class EditarProducto extends StatelessWidget {
  final Listado product;
  const EditarProducto({super.key, required this.product});
  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductService>(context);

    final productForm = Provider.of<ProductFormProvider>(context);
    
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
                      Text('Producto', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 30),
                      Image(
                        image: NetworkImage(product.productImage), height: 300, fit: BoxFit.cover
                      ),
                      Form(
                        key: productForm.formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: product.productImage,
                              onChanged: (value) => product.productImage = value,
                              validator: (value) {
                                if (value == null || value.length <= 1) {
                                  return 'La url es obligatoria';
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Ingrese aquí la URL de imagen',
                                labelText: 'URL Imagen',
                              ),
                            ),
                            TextFormField(
                              initialValue: product.productId.toString(),
                              onChanged: (value) {
                                if (int.tryParse(value) == null) {
                                  product.productId = 0;
                                } else {
                                  product.productId = int.parse(value);
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Ingrese aquí la ID del producto',
                                labelText: 'ID (0 = Crear)'
                              ),
                            ),
                            TextFormField(
                              initialValue: product.productName,
                              onChanged: (value) => product.productName = value,
                              validator: (value) {
                                if (value == null || value.length <= 1) {
                                  return 'El nombre es obligatorio';
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Ingrese aquí el nombre del producto',
                                labelText: 'Nombre'
                              ),
                            ),
                            TextFormField(
                              initialValue: product.productPrice.toString(),
                              onChanged: (value) {
                                if (int.tryParse(value) == null) {
                                  product.productPrice = 0;
                                } else {
                                  product.productPrice = int.parse(value);
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Ingrese aquí el precio del producto',
                                labelText: 'Precio'
                              ),
                            ),
                            TextFormField(
                              initialValue: product.productState,
                              onChanged: (value) => product.productState = value,
                              validator: (value) {
                                if (value == null || value.length <= 1) {
                                  return 'El estado es obligatorio';
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Ingrese aquí el estado del producto',
                                labelText: 'Estado'
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FloatingActionButton(
                                  onPressed: () async {
                                    if (!productForm.isValidForm()) return;
                                    await productService.deleteProduct(productForm.product);
                                    Navigator.pushNamed(context, 'lista_productos');
                                  },
                                  heroTag: null,
                                  child: Icon(Icons.delete_forever)
                                ),
                                SizedBox(width: 20),
                                FloatingActionButton(
                                  onPressed: () async {
                                    if (!productForm.isValidForm()) return;
                                    await productService.editOrCreateProduct(productForm.product);
                                    Navigator.pushNamed(context, 'lista_productos');
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