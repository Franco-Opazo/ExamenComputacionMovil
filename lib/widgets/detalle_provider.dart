import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class DetalleProvider extends StatelessWidget {
  final ListadoProviders provider;
  const DetalleProvider({super.key, required this.provider});
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
                    text: '${provider.providerId}\n'
                  ),
                  TextSpan(
                    text: ('Nombre: '),
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: '${provider.providerName}\n'
                  ),
                  TextSpan(
                    text: ('Apellido: '),
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: '${provider.providerLastName}\n'
                  ),
                  TextSpan(
                    text: ('Mail: '),
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: '${provider.providerMail}\n'
                  ),
                  TextSpan(
                    text: ('Estado: '),
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                    text: '${provider.providerState}\n'
                  ),
                ]
              )
            ),
          ),
          IconText(
            icon: (Icons.arrow_back), iconName: 'Volver a lista de providers', route: 'lista_providers'
          )
        ],
      ),
    );
  }
}