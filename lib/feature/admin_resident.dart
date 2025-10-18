// lib/feature/admin_resident.dart

import 'package:flutter/material.dart';

class AdminResidentScreen extends StatelessWidget {
  const AdminResidentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87, // Color de Fondo Consistente
      padding: const EdgeInsets.all(20.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Administración de RESIDENTES',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          Text(
            'CRUD de RESIDENTES: Aquí irá la lista de residentes asociados a un piso/departamento.',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}