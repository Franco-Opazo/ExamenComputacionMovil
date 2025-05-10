import 'dart:convert';

class Provider {
  Provider({
    required this.listadoProviders,
  });

  List<ListadoProviders> listadoProviders;

  factory Provider.fromJson(String str) => Provider.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Provider.fromMap(Map<String, dynamic> json) => Provider(
        listadoProviders:
            List<ListadoProviders>.from(json["Proveedores Listado"].map((x) => ListadoProviders.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Proveedores Listado": List<dynamic>.from(listadoProviders.map((x) => x.toMap())),
      };
}

class ListadoProviders {
  ListadoProviders({
    required this.providerId,
    required this.providerName,
    required this.providerLastName,
    required this.providerMail,
    required this.providerState,
  });

  int providerId;
  String providerName;
  String providerLastName;
  String providerMail;
  String providerState;

  factory ListadoProviders.fromJson(String str) => ListadoProviders.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListadoProviders.fromMap(Map<String, dynamic> json) => ListadoProviders(
        providerId: json["providerid"],
        providerName: json["provider_name"],
        providerLastName: json["provider_last_name"],
        providerMail: json["provider_mail"],
        providerState: json["provider_state"],
      );

  Map<String, dynamic> toMap() => {
        "provider_id": providerId,
        "provider_name": providerName,
        "provider_last_name": providerLastName,
        "provider_mail": providerMail,
        "provider_state": providerState,
      };

  ListadoProviders copy() => ListadoProviders(
      providerId: providerId,
      providerName: providerName,
      providerLastName: providerLastName,
      providerMail: providerMail,
      providerState: providerState);
}
