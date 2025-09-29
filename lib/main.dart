import 'package:flutter/material.dart';
import 'package:core_v001/login.dart'; // Tu importación

void main() {
  // Inicializa y corre la aplicación con el widget MyApp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Este widget es la raíz de tu aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación de Login', // Título actualizado
      theme: ThemeData(
        // Configuración del tema global de la aplicación
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // CAMBIO CLAVE: Aquí se muestra tu LoginPage en lugar de la página de demostración.
      home: LoginPage(),
    );
  }
}

// ATENCIÓN: Se han eliminado las clases MyHomePage, _MyHomePageState y su lógica
// del contador que venían por defecto en el proyecto, ya que no son necesarias
// para tu aplicación de login.

// Si tu archivo login.dart contiene un widget llamado 'LoginPage', este código funcionará.
