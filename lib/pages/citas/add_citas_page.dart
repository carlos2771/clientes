import 'package:clientes/services/firebase_services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddCitas(),
    );
  }
}

class AddCitas extends StatefulWidget {
  const AddCitas({Key? key});

  @override
  State<AddCitas> createState() => _AddCitasState();
}

class _AddCitasState extends State<AddCitas> {
  
  TextEditingController fechaController = TextEditingController(text: "");
  TextEditingController placaController = TextEditingController(text: "");
  String selectedEstado = 'En Proceso'; // Valor inicial para el estado
  TextEditingController estadoController = TextEditingController(text:"En proceso");
  TextEditingController servicioController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments  as Map;
    TextEditingController nombreController = TextEditingController( text: arguments["nombre"]);
    TextEditingController documentoController = TextEditingController( text: arguments["documento"]);


    return Scaffold(
      appBar: AppBar(
        title: const Text("Agendar Cita"),
      ),
      body: Column(
        children: [
          TextField(
            enabled: false,
            controller: nombreController ,
            decoration: const InputDecoration(
              hintText: "Ingrese su nombre",
            ),
          ),
          TextField(
            controller: fechaController,
            decoration: const InputDecoration(
              hintText: "Ingrese la fecha",
            ),
          ),
          TextField(
            controller: placaController,
            decoration: const InputDecoration(
              hintText: "Ingrese la placa",
            ),
          ),
          TextField(
            enabled: false,
            controller: documentoController,
            decoration: const InputDecoration(
              hintText: "Ingrese el documento",
            ),
          ),
          TextField(
            controller: estadoController,
            decoration: const InputDecoration(
              hintText: "",
            ),
          ),
         
          TextField(
            controller: servicioController,
            decoration: const InputDecoration(
              hintText: "Servicio",
              contentPadding: EdgeInsets.symmetric(vertical: 20.0), // Espacio vertical interno
    
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await addCita(nombreController.text, fechaController.text, placaController.text, documentoController.text,  estadoController.text , servicioController.text);
              // ignore: use_build_context_synchronously
              Navigator.pushNamed(context, "/homecitas");
            },
            child: const Text("Guardar"),
          )
        ],
      ),
    );
  }
}
