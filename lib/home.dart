// lib/home.dart

import 'package:flutter/material.dart';

class Home extends StatelessWidget { // <--- Aquí la clase se llama 'Home'
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Principal'),
      ),
      body: const Center(
        child: Text('¡Bienvenido!'),
      ),
    );
  }
}