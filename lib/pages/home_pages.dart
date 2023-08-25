import 'package:clientes/services/firebase_services.dart';
import 'package:clientes/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clientes"),
      ),
      body: FutureBuilder(
        future: getClientes(),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar los datos'));
          } else if (!snapshot.hasData || snapshot.data.isEmpty) {
            return const Center(child: Text('No hay clientes disponibles'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                final cliente = snapshot.data[index];
                return Dismissible(
                  key: Key(cliente["uid"]),
                  onDismissed: (direction) async {
                    await deleteCliente(cliente["uid"]);
                    setState(() {
                      snapshot.data.removeAt(index);
                    });
                  },
                  confirmDismiss: (direction) async {
                    return await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("¿Está seguro de querer eliminar a ${cliente["nombre"]}?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: const Text(
                                "Cancelar",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: const Text("Sí, estoy seguro"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Icon(Icons.delete),
                  ),
                  direction: DismissDirection.endToStart,
                  child: ListTile(
                    title: Text(
                      "Nombre: ${cliente["nombre"]} Apellido: ${cliente["apellido"]} Teléfono: ${cliente["telefono"]} Email: ${cliente["email"]} Documento: ${cliente["documento"]}",
                    ),
                    onTap: () async {
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
                    trailing: ElevatedButton( // boton de notificacion
                      onPressed: () {
                        mostrarNotificacion();
                      },
                      child: const Text("True"),
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            label: 'Agregar cliente',
            onTap: () async {
              await Navigator.pushNamed(context, "/add");
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}