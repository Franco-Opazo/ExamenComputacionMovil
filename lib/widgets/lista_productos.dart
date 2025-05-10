import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../screens/screens.dart';
import '../widgets/widgets.dart';

class ListaProductos extends StatelessWidget {
  const ListaProductos({super.key});
  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductService>(context);

    if (productService.isLoading) return LoadingScreen();

    return ListView(
      children: [
        NavBar(),
        ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: productService.products.length,
          itemBuilder: (BuildContext context, index) {
            final product = productService.products[index];
            return Container(
              padding: EdgeInsets.all(16),
              height: 350,
              color: Colors.grey,
              child: Center(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect
                      (borderRadius: BorderRadius.circular(300),child: Image(image: NetworkImage(product.productImage), width: 350 ,height: 350, fit: BoxFit.cover))
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        color: Colors.blue,
                        width: 200,
                        child: Text(product.productName, style: TextStyle(fontSize: 24))
                      )
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        color: Colors.yellow,
                        child: Text('\$${product.productPrice}', style: TextStyle(fontSize: 24))
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        color: Colors.yellow,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pushNamed(context, 'detalle_producto', arguments: product),
                              icon: Icon(Icons.info)
                            ),
                            IconButton(
                              onPressed: () => Navigator.pushNamed(context, 'editar_producto', arguments: product),
                              icon: Icon(Icons.edit_document)
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            );
          },
        ),
      ],
    );
  }
}