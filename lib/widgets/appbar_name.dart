import 'package:flutter/material.dart';

class AppbarName extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  const AppbarName({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange,
      title: Text(name),
      elevation: 10,
      automaticallyImplyLeading: false,
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}