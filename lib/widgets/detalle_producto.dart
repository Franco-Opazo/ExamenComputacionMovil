import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class DetalleProducto extends StatelessWidget {
  final Listado product;
  const DetalleProducto({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NavBar(),
          Center(
            child: Image(
              image: NetworkImage(product.productImage), width: MediaQuery.of(context).size.width, fit: BoxFit.cover
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 20, color: Colors.black),
                children: [
                  TextSpan(
                    text: ('ID: '),
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: '${product.productId}\n'
                  ),
                  TextSpan(
                    text: ('Nombre: '),
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: '${product.productName}\n'
                  ),
                  TextSpan(
                    text: ('Precio: '),
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: '\$${product.productPrice}\n'
                  ),
                  TextSpan(
                    text: ('Estado: '),
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: '${product.productState}\n'
                  ),
                  TextSpan(
                    text: ('URL Imagen: '),
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: '${product.productImage}\n'
                  ),
                ]
              )
            ),
          ),
          IconText(
            icon: (Icons.arrow_back), iconName: 'Volver a lista de productos', route: 'lista_productos'
          )
        ],
      ),
    );
  }
}