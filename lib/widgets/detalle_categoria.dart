import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class DetalleCategoria extends StatelessWidget {
  final ListadoCategorias category;
  const DetalleCategoria({super.key, required this.category});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NavBar(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 20, color: Colors.black),
                children: [
                  TextSpan(
                    text: ('ID: '),
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: '${category.categoryId}\n'
                  ),
                  TextSpan(
                    text: ('Nombre: '),
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: '${category.categoryName}\n'
                  ),
                  TextSpan(
                    text: ('Estado: '),
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: '${category.categoryState}\n'
                  ),
                ]
              )
            ),
          ),
          IconText(
            icon: (Icons.arrow_back), iconName: 'Volver a lista de categorías', route: 'lista_categorias'
          )
        ],
      ),
    );
  }
}