// To parse this JSON data, do
//
//     final productModel = productModelFromMap(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

SucursalModel productModelFromMap(String str) =>
    SucursalModel.fromMap(json.decode(str));

String productModelToMap(SucursalModel data) => json.encode(data.toMap());

class SucursalModel {
  SucursalModel({
    this.cantidadProveedores,
    this.direccion,
    this.email,
    this.encargado,
    this.id,
    this.nombre,
    this.listaProveedores,
  });

  int? cantidadProveedores;
  String? direccion;
  String? email;
  String? encargado;
  String? id;
  String? nombre;
  List<dynamic>? listaProveedores;

  SucursalModel copyWith({
    int? cantidadProveedores,
    String? direccion,
    String? email,
    String? encargado,
    String? id,
    String? nombre,
    List<dynamic>? listaProveedores,
  }) =>
      SucursalModel(
        cantidadProveedores: cantidadProveedores ?? this.cantidadProveedores,
        direccion: direccion ?? this.direccion,
        email: email ?? this.email,
        encargado: encargado ?? this.encargado,
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        listaProveedores: listaProveedores ?? this.listaProveedores,
      );

  factory SucursalModel.fromMap(DocumentSnapshot<Map<String, dynamic>> json) =>
      SucursalModel(
        cantidadProveedores: json.data()!["cantidadProveedores"],
        direccion: json.data()!["direccion"],
        email: json.data()!["email"],
        encargado: json.data()!["encargado"],
        id: json.data()!["id"],
        nombre: json.data()!["nombre"],
        // listaProveedores:
        //     List<dynamic>.from(json.data()!["listaProveedores"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "cantidadProveedores": cantidadProveedores,
        "direccion": direccion,
        "email": email,
        "encargado": encargado,
        "id": id,
        "nombre": nombre,
        "listaProveedores": List<dynamic>.from(listaProveedores!.map((x) => x)),
      };
}
