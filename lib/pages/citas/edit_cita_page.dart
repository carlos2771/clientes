import 'package:clientes/services/firebase_services.dart';
import 'package:flutter/material.dart';

class EditCitas extends StatefulWidget {
  const EditCitas({super.key});

  @override
  State<EditCitas> createState() => _EditClienteState();
}

class _EditClienteState extends State<EditCitas> {

  TextEditingController nombreController = TextEditingController(text: "");
  TextEditingController fechaController = TextEditingController(text: "");
  TextEditingController placaController = TextEditingController(text: "");
  TextEditingController estadoController = TextEditingController(text: "");
  TextEditingController servicioController = TextEditingController(text: "");
  @override

  Widget build(BuildContext context) {
  final Map arguments = ModalRoute.of(context)!.settings.arguments as Map; //  se utiliza para obtener los argumentos pasados a una ruta específica en Flutter y almacenarlos en una variable llamada arguments. Una vez almacenados en arguments, se pueden acceder y utilizar los datos pasados para realizar alguna funcionalidad específica en la pantalla correspondiente.

  nombreController.text = arguments ["nombre"];
  fechaController.text = arguments ["fecha"];
  placaController.text = arguments ["placa"];
  estadoController.text = arguments ["estado"];
  servicioController.text = arguments ["servicio"];
  
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Cita"),
      ),
      
      body :   Column(
        children: [
           TextField(
            enabled: false,
            controller: nombreController,
            decoration: const InputDecoration(
            hintText: "",
            ),
          ),
           TextField(
            controller: fechaController,
            decoration: const InputDecoration(
            hintText: "ingrese la nueva fecha",
            ),
          ),
           TextField(
            controller: placaController,
            decoration: const InputDecoration(
            hintText: "ingrese su nueva placa",
            ),
          ),
           TextField(
            controller: estadoController,
            decoration: const InputDecoration(
            hintText: "estado",
            ),
          ),
           TextField(
            controller: servicioController,
            decoration: const InputDecoration(
            hintText: "ingese su servicio",
            ),
          ),
          ElevatedButton(onPressed: () async{
            // print(nombreController.text + telefonoController.text + emailController.text + documentoController.text);
            // await addCliente(nombreController.text, telefonoController.text, emailController.text, documentoController.text).then((_) {
            //   Navigator.pop(context); // para comprobar que esta funcionando
            // print(arguments["uid"]);// para ver que si este trayendo el id
            // });

            await updateCita(arguments["uid"],nombreController.text, fechaController.text, placaController.text, estadoController.text, servicioController.text).then((_){
              Navigator.pop(context);
            });
          }, child: const Text("Acutializar"),)
        ],
      ),
    );
  }
}