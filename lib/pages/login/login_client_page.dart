// import 'package:flutter/material.dart';
// // import '../services/firebase_services.dart';

// class LoginClient extends StatefulWidget {
//   const LoginClient({Key? key}) : super(key: key);

//   @override
//   State<LoginClient> createState() => _LoginClientState();
// }

// class _LoginClientState extends State<LoginClient> {
//   TextEditingController emailController = TextEditingController(text: "");

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           cuerpo(),
//           FutureBuilder(
//             // future: getClientes(),
//             builder: ((context, snapshot) {
//               if (snapshot.hasData) {
//                 return Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//                   child: TextField(
//                     controller: emailController,
//                     decoration: const InputDecoration(
//                       hintText: "Email",
//                       fillColor: Colors.white,
//                       filled: true,
//                     ),
//                   ),
//                 );
//               }
//                else {
//                 return CircularProgressIndicator(); // Agregamos un indicador de carga mientras espera los datos
//               }
//             }),
//           ),
//         ],
//       ),
//     );
//   }



//   Widget cuerpo() {
//     return Container(
//       decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: NetworkImage(
//                   "https://www.pockettactics.com/wp-content/sites/pockettactics/2023/06/motorbike-games.jpg"),
//               fit: BoxFit.cover // para que abarque toda la pantalla
//               )),
//       child: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[nombre(), cliente(), contrasena(), boton()],
//       )),
//     );
//   }

//   Widget nombre() {
//     return const Text(
//       "Sign in",
//       style: TextStyle(
//           color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),
//     );
//   }

//   Widget cliente() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//       child: TextField(
//         controller: emailController,
//         decoration: const InputDecoration(
//           hintText: "Email",
//           fillColor: Colors.white, // color fondo del input
//           filled: true, // le esta diciendo que si se ponga el color de fondo
//         ),
//       ),
//     );
//   }

//   Widget contrasena() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//       child: const TextField(
//         obscureText: true,
//         decoration: InputDecoration(
//           hintText: "Contraseña",
//           fillColor: Colors.white, // color fondo del input
//           filled: true, // le esta diciendo que si se ponga el color de fondo
//         ),
//       ),
//     );
//   }

//   Widget boton() {
//     return TextButton(
//       onPressed: () {
//         Navigator.pushNamed(context, "/home");
//       },
//       child: const Text(
//         "Listo",
//         style: TextStyle(fontSize: 22.0, color: Colors.white),
//       ),
//     );
//   }
// }
