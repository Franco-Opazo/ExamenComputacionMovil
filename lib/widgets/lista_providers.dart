import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../screens/screens.dart';
import '../widgets/widgets.dart';

class ListaProviders extends StatelessWidget {
  const ListaProviders({super.key});
  @override
  Widget build(BuildContext context) {

    final providerService = Provider.of<ProviderService>(context);

    if (providerService.isLoading) return LoadingScreen();

    return ListView(
      children: [
        NavBar(),
        ListView.separated(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: providerService.providers.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) { 
            final provider = providerService.providers[index];
            return ListTile(
              leading: Text('${provider.providerId}'),
              title: Text('${provider.providerName} ${provider.providerLastName}'),
              subtitle: Text(provider.providerMail),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pushNamed(context, 'detalle_provider', arguments: provider),
                    icon: Icon(Icons.info),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pushNamed(context, 'editar_provider', arguments: provider),
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
