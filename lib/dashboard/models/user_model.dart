// lib/models/user_model.dart

// Modelo para la Gestión de Usuarios
class UserModel {
  final int idUsuario;
  final String nombre;
  final String rol;
  final String departamento;
  final String email;
  final String estado;

  UserModel({
    required this.idUsuario,
    required this.nombre,
    required this.rol,
    required this.departamento,
    required this.email,
    required this.estado,
  });
}

// Datos SIMULADOS para la tabla de usuarios
final mockUserList = [
  UserModel(idUsuario: 101, nombre: 'Ana García', rol: 'Residente', departamento: 'A-101', email: 'ana@ejemplo.com', estado: 'Activo'),
  UserModel(idUsuario: 102, nombre: 'Luis Pérez', rol: 'Administrador', departamento: 'N/A', email: 'luis@admin.com', estado: 'Activo'),
  UserModel(idUsuario: 103, nombre: 'María Soto', rol: 'Empleado', departamento: 'N/A', email: 'maria@ejemplo.com', estado: 'Inactivo'),
  UserModel(idUsuario: 104, nombre: 'Juan Ríos', rol: 'Residente', departamento: 'B-205', email: 'juan@ejemplo.com', estado: 'Activo'),
];

// Modelo para el Resumen Ejecutivo (KPI Cards, basado en Factura, Ticket, Pago)
class FinancialSummary {
  final double morosityRate; // Tasa de morosidad
  final double outstandingAmountUsd; // Monto pendiente
  final double incomeThisMonthUsd; // Ingreso del mes
  final int openTickets; // Tickets abiertos

  FinancialSummary({
    required this.morosityRate,
    required this.outstandingAmountUsd,
    required this.incomeThisMonthUsd,
    required this.openTickets,
  });
}

// Datos SIMULADOS para los KPI
final mockSummaryData = FinancialSummary(
  morosityRate: 14.5,
  outstandingAmountUsd: 6800.00,
  incomeThisMonthUsd: 18500.00,
  openTickets: 24,
);