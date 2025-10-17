import 'package:flutter/material.dart';
import 'package:core_v001/login.dart'; // Importa la página de login

class CredentialsPage extends StatelessWidget {
  const CredentialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Credenciales'),
        centerTitle: true,
      ),
      // 1. Usamos Center para centrar el formulario horizontalmente
      body: Center(
        // 2. Usamos ConstrainedBox para limitar el ancho máximo de los campos a 400px
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 400.0, 
          ),
          child: SingleChildScrollView( // 3. Añadido para evitar desbordamientos en móvil
            child: Padding(
              padding: const EdgeInsets.all(32.0), // Padding aumentado para mejor estética
              child: Column(
                // crossAxisAlignment.stretch hace que los TextField y el Button
                // tomen el ancho máximo de 400px definido por ConstrainedBox
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Título opcional
                  const Text(
                    'Define tu Cuenta',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  
                  // Campo Nombre de usuario
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Nombre de usuario',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Campo Contraseña
                  const TextField(
                    obscureText: true, // Oculta la contraseña
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Campo Confirmar Contraseña
                  const TextField(
                    obscureText: true, // Oculta la contraseña
                    decoration: InputDecoration(
                      labelText: 'Confirmar Contraseña',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // Botón de Registrarse
                  ElevatedButton(
                    onPressed: () {
                      // Lógica de registro completa y redirección
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Registrarse',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}