import 'package:flutter/material.dart';

class CitaView extends StatelessWidget {
  final Future<Map<String, dynamic>?> citaFuture;
  final String documento;

  CitaView({required this.citaFuture, required this.documento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Detalles de la Cita'),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: citaFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: Text('No se encontró una cita con el documento $documento'),
            );
          } else {
            final cita = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nombre: ${cita["nombre"]}'),
                  Text('Fecha: ${cita["fecha"]}'),
                  Text('Placa: ${cita["placa"]}'),
                  Text('Estado: ${cita["estado"]}'),
                  Text('Servicio: ${cita["servicio"]}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
