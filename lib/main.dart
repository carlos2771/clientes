import 'package:clientes/pages/edit_client_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:clientes/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:clientes/pages/add_client_page.dart';
import 'package:clientes/pages/home_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initNotifications(); // para que se ejecute como middleware
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "material App",
      initialRoute: "/",
      routes: {
        // "/": (context) => const Loginclient(),
        "/": (context) =>  const Home(),
        "/add": (context) => const AddCliente(),
        "/edit": (context) => const EditCliente(),
        // "/notification": (context) => const Notification(),
    
      },
    );
     
  }
}