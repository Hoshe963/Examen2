import 'dart:convert';
import 'package:intl/intl.dart';

// Funciones para parsear y serializar los datos de Matricula
List<Matricula> matriculasFromJson(String str) =>
    List<Matricula>.from(json.decode(str).map((x) => Matricula.fromJson(x)));

String matriculasToJson(List<Matricula> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Matricula {
  int? idMatricula;
  String curso;
  String estudiante;
  int numeroHoras;
  int numeroCreditos;
  DateTime? fechaRegistro;
  String estado;

  Matricula({
    this.idMatricula,
    required this.curso,
    required this.estudiante,
    required this.numeroHoras,
    required this.numeroCreditos,
    this.fechaRegistro,
    required this.estado,
  });

  // Método para convertir JSON en un objeto Matricula (Recepción de datos)
  factory Matricula.fromJson(Map<String, dynamic> json) {
    DateTime? parseDate(String? dateStr) {
      if (dateStr == null || dateStr.isEmpty) return null;

      try {
        return DateTime.parse(dateStr);
      } catch (e) {
        print("Error parsing date: $e");
        return null;
      }
    }

    return Matricula(
      idMatricula: json["idMatricula"],  // Coincidir con la clave exacta en el backend
      curso: json["Curso"] ?? 'Curso no especificado',
      estudiante: json["Estudiante"] ?? 'Estudiante no especificado',
      numeroHoras: json["Numero de Horas"] ?? 0,
      numeroCreditos: json["Numero de Creditos"] ?? 0,
      fechaRegistro: parseDate(json["Fecha de Registro"]),
      estado: json["Estado"] ?? 'Estado no especificado',
    );
  }

  // Método para convertir un objeto Matricula a JSON (Envío de datos)
  Map<String, dynamic> toJson() => {
    "idMatricula": idMatricula,
    "curso": curso,
    "estudiante": estudiante,
    "numero_horas": numeroHoras,
    "numero_creditos": numeroCreditos,
    "fecha_registro": fechaRegistro?.toIso8601String(),
    "estado": estado,
  };
}
