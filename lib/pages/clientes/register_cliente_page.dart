import 'package:flutter/material.dart';
import 'package:clientes/services/firebase_services.dart';

class RegisterCliente extends StatefulWidget {
  const RegisterCliente({Key? key});

  @override
  State<RegisterCliente> createState() => _RegisterClienteState();
}

class _RegisterClienteState extends State<RegisterCliente> {
  TextEditingController nombreController = TextEditingController(text: "");
  TextEditingController apellidoController = TextEditingController(text: "");
  TextEditingController telefonoController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController documentoController = TextEditingController(text: "");
  TextEditingController password1Controller = TextEditingController(text: "");
  TextEditingController password2Controller = TextEditingController(text: "");

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Validación de correo electrónico
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese un correo electrónico';
    }
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

  // Validación de números
  String? _validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo es obligatorio';
    }
    if (!isNumeric(value)) {
      return 'Ingrese un número válido';
    }
    return null;
  }
    // Validación de texto genérica para campos obligatorios
  String? _validateText(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo es obligatorio';
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
              _buildTextField(nombreController, "Nombre", validator: _validateText),
              _buildTextField(apellidoController, "Apellido", validator: _validateText),
              _buildTextField(telefonoController, "Teléfono", maxLength: 11, validator: _validateNumber, keyboardType: TextInputType.phone),
              _buildTextField(emailController, "Email", validator: _validateEmail),
              _buildTextField(documentoController, "Documento", validator: _validateNumber, keyboardType: TextInputType.number),
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
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        maxLength: maxLength,
        validator: validator, // Asigna el validador
        obscureText: obscureText, // Oculta la contraseña si es necesario
        keyboardType: keyboardType, // Establece el tipo de teclado
        decoration: InputDecoration(
          labelText: labelText,
          hintText: "Ingrese su $labelText",
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  bool isNumeric(String? str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }
}
