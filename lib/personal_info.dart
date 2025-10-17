import 'package:flutter/material.dart';
import 'package:core_v001/credentials.dart'; // Importa la siguiente página

// Se asume que CredentialsPage es un StatelessWidget o StatefulWidget válido
// Si CredentialsPage no existe aún, tendrás que crearla para que este código compile.

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información Personal'),
        centerTitle: true, // Opcional: centra el título de la barra superior
      ),
      // Usamos Center para centrar el formulario si es más corto que la pantalla
      body: Center(
        // ConstrainedBox limita el ancho máximo del formulario a 400 píxeles.
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 400.0, 
          ),
          child: SingleChildScrollView( // Recomendado para evitar problemas con el teclado en móviles
            child: Padding(
              padding: const EdgeInsets.all(32.0), // Padding más generoso
              child: Column(
                mainAxisSize: MainAxisSize.min, // La columna solo ocupa el espacio necesario
                crossAxisAlignment: CrossAxisAlignment.stretch, // Estira los elementos al maxWidth (400px)
                children: <Widget>[
                  // Los TextField se estirarán para llenar el maxWidth: 400.0
                  
                  // Campo Nombre
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Campo Apellido
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Apellido',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Campo Teléfono
                  const TextField(
                    keyboardType: TextInputType.phone, // Sugerencia: Teclado de teléfono
                    decoration: InputDecoration(
                      labelText: 'Teléfono',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Campo Correo electrónico
                  const TextField(
                    keyboardType: TextInputType.emailAddress, // Sugerencia: Teclado de email
                    decoration: InputDecoration(
                      labelText: 'Correo electrónico',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // === NUEVO CAMPO: Número de Piso ===
                  const TextField(
                    keyboardType: TextInputType.number, // Para facilitar la entrada de números
                    decoration: InputDecoration(
                      labelText: 'Número de Piso',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // === NUEVO CAMPO: Número de Departamento ===
                  const TextField(
                    keyboardType: TextInputType.text, // Puede incluir letras y números (ej. "A", "101")
                    decoration: InputDecoration(
                      labelText: 'Número de Departamento',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // Botón Siguiente
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CredentialsPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Siguiente',
                      style: TextStyle(fontSize: 16),
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
