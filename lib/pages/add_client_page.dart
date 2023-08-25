import 'package:clientes/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddCliente extends StatefulWidget {
  const AddCliente({super.key});

  @override
  State<AddCliente> createState() => _AddClienteState();
}

class _AddClienteState extends State<AddCliente> {
  TextEditingController nombreController = TextEditingController(text: "");
  TextEditingController apellidoController = TextEditingController(text: "");
  TextEditingController telefonoController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController documentoController = TextEditingController(text: "");
  TextEditingController password1Controller = TextEditingController(text: "");
  TextEditingController password2Controller = TextEditingController(text: "");

  //validaciones

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar cliente"),
      ),
      body: Column(
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
            inputFormatters: [
              LengthLimitingTextInputFormatter(10), // Limitar a 10 caracteres
              FilteringTextInputFormatter.digitsOnly,
            ],
            controller: telefonoController,
            decoration: const InputDecoration(
              hintText: "ingrese su telefono",
            ),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: "ingrese su email",
            ),
          ),
          TextField(
            controller: documentoController,
            decoration: const InputDecoration(
              hintText: "ingrese su documento",
            ),
          ),
          TextField(
            controller: password1Controller,
            decoration: const InputDecoration(
              hintText: "ingrese contraseña del cliente",
            ),
          ),
          TextField(
            controller: password2Controller,
            decoration: const InputDecoration(
              hintText: "confirme la contraseña",
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // print(nombreController.text + telefonoController.text + emailController.text + documentoController.text);
              await addCliente(
                      nombreController.text,
                      apellidoController.text,
                      telefonoController.text,
                      emailController.text,
                      documentoController.text,
                      password1Controller.text)
                  .then((_) {
                Navigator.pop(context);
              });
            },
            child: const Text("Guardar"),
          )
        ],
      ),
    );
  }
}
