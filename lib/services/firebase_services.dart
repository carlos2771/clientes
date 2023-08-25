import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future <List> getClientes() async{
  List clientes = [];
  CollectionReference collectionReference = db.collection("clientes");

  QuerySnapshot queryCliente = await collectionReference.get();
  for (var documento in queryCliente.docs){
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>; // documento.data devuelve lo que se realizo en la consulta que devuelve un map string que contiene los datos almacenados en el documento
    // fire store devuelve un Map<string, objet> entonces se castea con el as map para que devuelva un string dynamic y poder acceder a sus datos
    final cliente = {
      "uid":documento.id,
      "nombre" : data["nombre"],
      "apellido" : data["apellido"],
      "telefono": data["telefono"],
      "email" : data["email"],
      "documento": data["documento"],
      "password": data["passsword"],
      
    };
    clientes.add(cliente);
  }
  return clientes;
}

//añadir los datos 
Future<void> addCliente(String nombre, String apellido, String telefono, String email, String documento, String passsword ) async {
  await db.collection("clientes").add(
    {
      "nombre" : nombre,
      "apellido" : apellido,
      "telefono": telefono,
      "email" : email,
      "documento": documento,
      "password": passsword,
    });
}

Future<void> updateCliente(String uid,String newNombre, String newApellido, String newTelefono, String newEmail, String newDocumento) async{
  await db.collection("clientes").doc(uid).set({
    "nombre" : newNombre,
    "apellido" : newApellido,
    "telefono" : newTelefono,
    "email" : newEmail,
    "documento": newDocumento 
    });
}

// Eliminar

Future <void> deleteCliente (String uid) async{
  await db.collection("clientes").doc(uid).delete();
}

Future<void> login( String email ) async {
  
}


