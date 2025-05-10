import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../screens/screens.dart';
import '../widgets/widgets.dart';

class ListaCategorias extends StatelessWidget {
  const ListaCategorias({super.key});
  @override
  Widget build(BuildContext context) {

    final categoryService = Provider.of<CategoryService>(context);

    if (categoryService.isLoading) return LoadingScreen();

    return ListView(
      children: [
        NavBar(),
        ListView.separated(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: categoryService.categories.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) { 
            final category = categoryService.categories[index];
            return ListTile(
              leading: Text('${category.categoryId}'),
              title: Text(category.categoryName),
              subtitle: Text(category.categoryState),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pushNamed(context, 'detalle_categoria', arguments: category),
                    icon: Icon(Icons.info),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pushNamed(context, 'editar_categoria', arguments: category),
                    icon: Icon(Icons.edit_document),
                  )
                ],
              ),
            );
          }
        ),
      ]
    );
  }
}
