import 'package:clientes/services/firebase_services.dart';
import 'package:flutter/material.dart';

class EditCliente extends StatefulWidget {
  const EditCliente({super.key});

  @override
  State<EditCliente> createState() => _EditClienteState();
}

class _EditClienteState extends State<EditCliente> {

  TextEditingController nombreController = TextEditingController(text: "");
  TextEditingController apellidoController = TextEditingController(text: "");
  TextEditingController telefonoController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController documentoController = TextEditingController(text: ""); 
  TextEditingController passwordController = TextEditingController(text: ""); 

  @override

  Widget build(BuildContext context) {
  final Map arguments = ModalRoute.of(context)!.settings.arguments as Map; //  se utiliza para obtener los argumentos pasados a una ruta específica en Flutter y almacenarlos en una variable llamada arguments. Una vez almacenados en arguments, se pueden acceder y utilizar los datos pasados para realizar alguna funcionalidad específica en la pantalla correspondiente.
  nombreController.text = arguments["nombre"];
  apellidoController.text = arguments["apellido"];
  telefonoController.text = arguments["telefono"];
  emailController.text = arguments["email"];
  documentoController.text = arguments["documento"];
  passwordController.text = arguments["passwordController"];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar cliente"),
      ),
      body :   Column(
        children: [
           TextField(
            controller: nombreController,
            decoration: const InputDecoration(
            hintText: "ingrese su nombre",
            ),
          ),
           TextField(
            controller: apellidoController,
            decoration: const InputDecoration(
            hintText: "ingrese su apellido",
            ),
          ),
           TextField(
            controller: telefonoController,
            decoration: const InputDecoration(
            hintText: "ingese su telefono",
            ),
          ),
           TextField(
            controller: emailController,
            decoration: const InputDecoration(
            hintText: "ingese su email",
            ),
          ),
           TextField(
            controller: documentoController,
            decoration: const InputDecoration(
            hintText: "ingese su documento",
            ),
          ),
           TextField(
            controller: passwordController,
            decoration: const InputDecoration(
            hintText: "ingrese su nueva contraseña",
            ),
          ),
          ElevatedButton(onPressed: () async{
            // print(nombreController.text + telefonoController.text + emailController.text + documentoController.text);
            // await addCliente(nombreController.text, telefonoController.text, emailController.text, documentoController.text).then((_) {
            //   Navigator.pop(context); // para comprobar que esta funcionando
            // print(arguments["uid"]);// para ver que si este trayendo el id
            // });

            await updateCliente(arguments["uid"], nombreController.text, telefonoController.text, emailController.text, documentoController.text, passwordController.text).then((_){
              Navigator.pop(context);
            });
          }, child: const Text("Acutializar"),)
        ],
      ),
    );
  }
}