import 'package:clientes/services/firebase_services.dart';
import 'package:flutter/material.dart';


class Loginclient extends StatefulWidget {
  const Loginclient({Key? key}) : super(key: key);

  @override
  State<Loginclient> createState() => _LoginclientState();
}

class _LoginclientState extends State<Loginclient> {
  TextEditingController emailController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    emailController.text = arguments["email"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar cliente"),
      ),
      body: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: "Ingrese su email",
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (emailController.text == arguments["email"]) {
                Navigator.pushNamed(context, "/home");
              }
            },
            child: const Text("Actualizar"),
          )
        ],
      ),
    );
  }





  Widget cuerpo() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://www.pockettactics.com/wp-content/sites/pockettactics/2023/06/motorbike-games.jpg"),
              fit: BoxFit.cover // para que abarque toda la pantalla
              )),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[nombre(), contrasena(), boton()],
      )),
    );
  }

  Widget nombre() {
    return const Text(
      "Sign in",
      style: TextStyle(
          color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),
    );
  }

  // Widget cliente() {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
  //     child: TextField(
  //       controller: emailController,
  //       decoration: const InputDecoration(
  //         hintText: "Email",
  //         fillColor: Colors.white, // color fondo del input
  //         filled: true, // le esta diciendo que si se ponga el color de fondo
  //       ),
  //     ),
  //   );
  // }

  Widget contrasena() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: const TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Contraseña",
          fillColor: Colors.white, // color fondo del input
          filled: true, // le esta diciendo que si se ponga el color de fondo
        ),
      ),
    );
  }

  Widget boton() {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, "/home");
      },
      child: const Text(
        "Listo",
        style: TextStyle(fontSize: 22.0, color: Colors.white),
      ),
    );
  }
}
