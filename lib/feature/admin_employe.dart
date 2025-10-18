// lib/feature/admin_employe.dart

import 'package:flutter/material.dart';

class AdminEmployeScreen extends StatelessWidget {
  const AdminEmployeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87, // Color de Fondo Consistente
      padding: const EdgeInsets.all(20.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Administración de EMPLEADOS',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          Text(
            'CRUD de EMPLEADOS: Aquí irá la tabla con la lista de empleados para gestionar sus datos y roles.',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}