// lib/feature/admin_visitor.dart

import 'package:flutter/material.dart';

class AdminVisitorScreen extends StatelessWidget {
  const AdminVisitorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87, // Color de Fondo Consistente
      padding: const EdgeInsets.all(20.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Gestión de VISITANTES',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          Text(
            'CRUD de VISITANTES: Gestión de permisos de entrada y registro de visitantes.',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}