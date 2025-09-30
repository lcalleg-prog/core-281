import 'package:flutter/material.dart';
import 'package:core_v001/home.dart';
import 'package:core_v001/personal_info.dart'; //importa a personal_info

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1. Usa LayoutBuilder para obtener el ancho disponible
    return Scaffold(
      appBar: AppBar(
        title: Text('CORE'),
        // Opcional: Centrar el título
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView( // Añadimos SingleChildScrollView para evitar desbordamiento en teclados móviles
          child: Padding(
            padding: const EdgeInsets.all(32.0), // Aumentamos el padding para mejor estética
            // 2. Usamos ConstrainedBox para limitar el ancho máximo de la columna
            child: ConstrainedBox(
              constraints: BoxConstraints(
                // Establece un ancho máximo de 400 píxeles. Esto hace que las cajas y el botón
                // no se estiren más allá de este límite en pantallas grandes.
                maxWidth: 400.0, 
              ),
              child: Column(
                // La Column ya está configurada para centrar el contenido verticalmente
                mainAxisAlignment: MainAxisAlignment.center,
                // Alinea todos los widgets a lo largo del eje cruzado (horizontalmente).
                // Al ponerlo en stretch, las cajas ocuparán el ancho máximo de 400px que definimos.
                crossAxisAlignment: CrossAxisAlignment.stretch, 
                children: <Widget>[
                  // Opcional: Título grande de la aplicación
                  Text(
                    'Bienvenido',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: 32),
                  
                  // Campo para el nombre de usuario
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Usuario',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), // Bordes redondeados
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 16),
                  
                  // Campo para la contraseña
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), // Bordes redondeados
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  SizedBox(height: 32),
                  
                  // Botón de "iniciar sesion"
                  ElevatedButton(
                    onPressed: () {
                      //boton que redirige a home
                      Navigator.push(
                        context,
                            MaterialPageRoute(
                            builder: (context) => const Home(),
                                              ),
                                    );

                      print('Botón de "iniciar sesion" presionado');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      // Puedes cambiar el color aquí si lo deseas
                      backgroundColor: Colors.deepPurple,
                    ),
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      
                    ),
                  ),
                  
                  //Botón de registrarse
                  ElevatedButton(
                    onPressed: () {
                      //boton para registrarse
                      Navigator.push(
                        context,
                            MaterialPageRoute(
                            builder: (context) => const PersonalInfoPage(),
                                              ),
                                    );

                      print('Botón de "registrarse" presionado');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      // Puedes cambiar el color aquí si lo deseas
                      //backgroundColor: Colors.deepPurple,
                    ),
                    child: Text(
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
// psswrd supabase b4s3c0r3-2025