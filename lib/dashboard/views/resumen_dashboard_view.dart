// lib/views/resumen_dashboard_view.dart

import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../widgets/kpi_card.dart';

class ResumenDashboardView extends StatelessWidget {
  // Quitamos 'const' por seguridad, aunque aquí funciona
  const ResumenDashboardView({super.key}); 

  @override
  Widget build(BuildContext context) {
    final data = mockSummaryData; 
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Resumen Financiero y Operativo',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 30),

        // GridView para mostrar las 4 tarjetas KPI
        GridView.count(
          crossAxisCount: 4, 
          crossAxisSpacing: 30, 
          mainAxisSpacing: 30, 
          shrinkWrap: true, 
          childAspectRatio: 1.6, 
          children: <Widget>[
            // Tasa de Morosidad (Factura)
            KpiCard(
              title: 'Tasa de Morosidad',
              value: '${data.morosityRate.toStringAsFixed(2)}%',
              icon: Icons.error_outline,
              color: Colors.redAccent, 
            ),
            // Monto Pendiente (Factura)
            KpiCard(
              title: 'Monto Moroso Pendiente',
              value: '\$${data.outstandingAmountUsd.toStringAsFixed(2)}',
              icon: Icons.money_off,
              color: Colors.orangeAccent,
            ),
            // Ingreso del Mes (Pago)
            KpiCard(
              title: 'Ingreso Total (Mes)',
              value: '\$${data.incomeThisMonthUsd.toStringAsFixed(2)}',
              icon: Icons.trending_up,
              color: Colors.greenAccent,
            ),
            // Tickets Abiertos (Ticket)
            KpiCard(
              title: 'Tickets Abiertos',
              value: data.openTickets.toString(),
              icon: Icons.assignment_late,
              color: Colors.cyanAccent,
            ),
          ],
        ),
        const SizedBox(height: 40),
        const Text(
          'Tendencias y Gráficos',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 20),
        // Placeholder para el Gráfico
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF2C3E50),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Text(
              'Aquí irá el gráfico de tendencias de Ingresos y Morosidad.',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
          ),
        )
      ],
    );
  }
}