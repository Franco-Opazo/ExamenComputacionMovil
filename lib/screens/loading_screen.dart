import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LoadingScreen')),
      body: Center(child: Image(image: NetworkImage('https://thumbs.dreamstime.com/b/loading-progress-bar-download-progress-logo-design-modern-green-loading-bar-vector-design-loading-progress-bar-download-progress-264155311.jpg'))),
    );
  }
}