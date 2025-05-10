import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/providers.dart' as model_provider;
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';

class EditarProvider extends StatelessWidget {
  final model_provider.ListadoProviders provider;
  const EditarProvider({super.key, required this.provider});
  @override
  Widget build(BuildContext context) {

    final providerService = Provider.of<ProviderService>(context);

    final providerForm = Provider.of<ProviderFormProvider>(context);
    
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
                      Text('Provider', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 30),
                      Form(
                        key: providerForm.formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: provider.providerId.toString(),
                              onChanged: (value) {
                                if (int.tryParse(value) == null) {
                                  provider.providerId = 0;
                                } else {
                                  provider.providerId = int.parse(value);
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Ingrese aquí la ID de el provider',
                                labelText: 'ID (0 = Crear)'
                              ),
                            ),
                            TextFormField(
                              initialValue: provider.providerName,
                              onChanged: (value) => provider.providerName = value,
                              validator: (value) {
                                if (value == null || value.length <= 1) {
                                  return 'El nombre es obligatorio';
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Ingrese aquí el nombre del provider',
                                labelText: 'Nombre'
                              ),
                            ),
                            TextFormField(
                              initialValue: provider.providerLastName,
                              onChanged: (value) => provider.providerLastName = value,
                              validator: (value) {
                                if (value == null || value.length <= 1) {
                                  return 'El apellido es obligatorio';
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Ingrese aquí el apellido del provider',
                                labelText: 'Apellido'
                              ),
                            ),
                            TextFormField(
                              initialValue: provider.providerMail,
                              onChanged: (value) => provider.providerMail = value,
                              validator: (value) {
                                if (value == null || value.length <= 1) {
                                  return 'El mail es obligatorio';
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Ingrese aquí el mail del provider',
                                labelText: 'Mail'
                              ),
                            ),
                            TextFormField(
                              initialValue: provider.providerState,
                              onChanged: (value) => provider.providerState = value,
                              validator: (value) {
                                if (value == null || value.length <= 1) {
                                  return 'El estado es obligatorio';
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Ingrese aquí el estado del provider',
                                labelText: 'Estado'
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FloatingActionButton(
                                  onPressed: () async {
                                    if (!providerForm.isValidForm()) return;
                                    await providerService.deleteProvider(providerForm.provider);
                                    Navigator.pushNamed(context, 'lista_providers');
                                  },
                                  heroTag: null,
                                  child: Icon(Icons.delete_forever)
                                ),
                                SizedBox(width: 20),
                                FloatingActionButton(
                                  onPressed: () async {
                                    if (!providerForm.isValidForm()) return;
                                    await providerService.editOrCreateProvider(providerForm.provider);
                                    Navigator.pushNamed(context, 'lista_providers');
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