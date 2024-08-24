// To parse this JSON data, do
//
//     final usersResponse = usersResponseFromJson(jsonString);

import 'dart:convert';

import 'package:admn_dashboard/models/usuario.dart';

UsersResponse usersResponseFromJson(String str) => UsersResponse.fromJson(json.decode(str));

String usersResponseToJson(UsersResponse data) => json.encode(data.toJson());

class UsersResponse {
    int total;
    List<Usuario> usuarios;

    UsersResponse({
        required this.total,
        required this.usuarios,
    });

    factory UsersResponse.fromJson(Map<String, dynamic> json) => UsersResponse(
        total: json["total"],
        usuarios: List<Usuario>.from(json["usuarios"].map((x) => Usuario.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toJson())),
    };
}

