import 'package:clientes/pages/clientes/mi_cita.dart';
import 'package:clientes/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ClienteView extends StatefulWidget {
  final Future<Map<String, dynamic>?> clienteFuture;
  final String email;

  ClienteView({required this.clienteFuture, required this.email});

  @override
  _ClienteViewState createState() => _ClienteViewState();
}

class _ClienteViewState extends State<ClienteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tu perfil'),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: widget.clienteFuture,
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
              child: Text('No se encontró un cliente con el email ${widget.email}'),
            );
          } else {
            final cliente = snapshot.data!;
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://c4.wallpaperflare.com/wallpaper/177/391/765/anime-girls-motorcycle-hd-wallpaper-preview.jpg'), // Reemplaza con la URL de tu imagen de fondo
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      elevation: 4.0,
                      margin: const EdgeInsets.all(16.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nombre: ${cliente["nombre"]}',
                              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            Text('Apellido: ${cliente["apellido"]}'),
                            Text('Teléfono: ${cliente["telefono"]}'),
                            Text('Email: ${cliente["email"]}'),
                            Text('Documento: ${cliente["documento"]}'),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await Navigator.pushNamed(context, "/edit", arguments: {
                          "uid": cliente["uid"],
                          "nombre": cliente["nombre"],
                          "apellido": cliente["apellido"],
                          "telefono": cliente["telefono"],
                          "email": cliente["email"],
                          "documento": cliente["documento"],
                          "password": cliente["password"],
                        });
                        setState(() {});
                      },
                      child: const Text("Editar Perfil"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final citaFuture = getCitaPorDocumento(cliente["documento"]);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CitaView(
                              documento: cliente["documento"],
                              citaFuture: citaFuture,
                            ),
                          ),
                        );     
                      },
                      child: const Text("Mis Citas"),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            label: 'Agendar Cita',
            onTap: () async {
              await Navigator.pushNamed(context, "/add");
              setState(() {});
            },
          ),
          SpeedDialChild(
            label: 'Salir',
            onTap: () async {
              await Navigator.pushNamed(context, "/");
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
