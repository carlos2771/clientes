import 'package:flutter/material.dart';

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ElevatedButton(
        onPressed: (){
          
        }, 
        child:const Text("Mostrar Notificacion")),

    );
  }
}