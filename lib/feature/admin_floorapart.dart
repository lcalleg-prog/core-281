// lib/feature/admin_floorapart.dart

import 'package:flutter/material.dart';

class AdminFloorApartScreen extends StatelessWidget {
  const AdminFloorApartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87, // Color de Fondo Consistente
      padding: const EdgeInsets.all(20.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Gestión de Pisos y Departamentos',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          Text(
            'CRUD de ESTRUCTURA FÍSICA: Definición de pisos, números de apartamento y sus características.',
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}