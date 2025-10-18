// lib/feature/admin_commonarea.dart

import 'package:flutter/material.dart';

class AdminCommonAreaScreen extends StatelessWidget {
  const AdminCommonAreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87, // Color de Fondo Consistente
      padding: const EdgeInsets.all(20.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Gestión de Áreas Comunes',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          Text(
            'CRUD de ÁREAS: Gestión de piscina, gimnasio, salón de eventos, incluyendo reglas y horarios.',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}