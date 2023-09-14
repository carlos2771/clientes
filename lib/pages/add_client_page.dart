import 'package:clientes/services/firebase_services.dart';
import 'package:flutter/material.dart';

class AddCliente extends StatefulWidget {
  const AddCliente({Key? key});

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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  get labelLabelText => null; // Clave global para el formulario

  // Validación de correo electrónico
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese un correo electrónico';
    }
    // Puedes agregar una validación más sofisticada aquí si lo deseas
    if (!value.contains('@')) {
      return 'Ingrese un correo electrónico válido';
    }
    return null;
  }

  // Validación de contraseña
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese una contraseña';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  // Validación de confirmación de contraseña
  String? _validatePasswordConfirmation(String? value) {
    if (value != password1Controller.text) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Agregar Cliente",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey, // Asigna la clave del formulario
          child: Column(
            children: [
              _buildTextField(nombreController, "Nombre"),
              _buildTextField(apellidoController, "Apellido"),
              _buildTextField(telefonoController, "Teléfono", maxLength: 10),
              _buildTextField(emailController, "Email", validator: _validateEmail),
              _buildTextField(documentoController, "Documento"),
              _buildTextField(password1Controller, "Contraseña", validator: _validatePassword, obscureText: true),
              _buildTextField(password2Controller, "Confirmar Contraseña", validator: _validatePasswordConfirmation, obscureText: true),
              ElevatedButton(
                onPressed: () async {
                  // Verifica si el formulario es válido antes de continuar
                  if (_formKey.currentState!.validate()) {
                    // Las contraseñas coinciden y el correo electrónico es válido
                    await addCliente(
                      nombreController.text,
                      apellidoController.text,
                      telefonoController.text,
                      emailController.text,
                      documentoController.text,
                      password1Controller.text,
                    ).then((_) {
                      Navigator.pushNamed(context, "/");
                      setState(() {});
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                child: const Text(
                  "Guardar",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String labelText, {
    int? maxLength,
    String? Function(String?)? validator,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        maxLength: maxLength,
        validator: validator, // Asigna el validador
        obscureText: obscureText, // Oculta la contraseña si es necesario
        decoration: InputDecoration(
          labelText: labelText,
          hintText: "Ingrese su $labelLabelText",
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
