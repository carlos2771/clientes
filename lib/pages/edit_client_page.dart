import 'package:flutter/material.dart';
import 'package:clientes/services/firebase_services.dart';

class EditCliente extends StatefulWidget {
  const EditCliente({Key? key});

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
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nombreController.text = arguments["nombre"];
    apellidoController.text = arguments["apellido"];
    telefonoController.text = arguments["telefono"];
    emailController.text = arguments["email"];
    documentoController.text = arguments["documento"];
    passwordController.text = arguments["password"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Cambia el color de la barra de aplicación a negro
        title: const Text("Editar cliente", textAlign: TextAlign.center), // Centra el texto del AppBar
        centerTitle: true, // Centra el título del AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField(nombreController, "Nombre"),
            _buildTextField(apellidoController, "Apellido"),
            _buildTextField(telefonoController, "Teléfono"),
            _buildTextField(emailController, "Email"),
            _buildTextField(documentoController, "Documento"),
            _buildTextField(passwordController, "Nueva contraseña"),
            ElevatedButton(
              onPressed: () async {
                await updateCliente(
                  arguments["uid"],
                  nombreController.text,
                  apellidoController.text,
                  telefonoController.text,
                  emailController.text,
                  documentoController.text,
                  passwordController.text,
                ).then((_) {
                  Navigator.pop(context);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Cambia el color del botón a negro
              ),
              child: const Text("Actualizar"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
