import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'registro': (BuildContext context) => const RegistroScreen(),
    'login': (BuildContext context) => const LoginScreen(),
    'lista_productos': (BuildContext context) => const ListaProductosScreen(),
    'detalle_producto': (BuildContext context) => const DetalleProductoScreen(),
    'editar_producto': (BuildContext context) => const EditarProductoScreen(),
    'lista_categorias': (BuildContext context) => const ListaCategoriasScreen(),
    'detalle_categoria': (BuildContext context) => const DetalleCategoriaScreen(),
    'editar_categoria': (BuildContext context) => const EditarCategoriaScreen(),
    'lista_providers': (BuildContext context) => const ListaProvidersScreen(),
    'detalle_provider': (BuildContext context) => const DetalleProviderScreen(),
    'editar_provider': (BuildContext context) => const EditarProviderScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}
