// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:mobicar_app/app/modules/domain/entities/brand_entity.dart';

class BrandModel extends BrandEntity {
  @override
  final String nome;
  @override
  final String codigo;

  const BrandModel({
    required this.nome,
    required this.codigo,
  }) : super(nome: nome, codigo: codigo);

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'codigo': codigo,
    };
  }

  static BrandModel fromMap(Map<String, dynamic> map) {
    return BrandModel(
      nome: map['nome'],
      codigo: map['codigo'],
    );
  }

  String toJson() => json.encode(toMap());

  static BrandModel fromJson(String source) => fromMap(json.decode(source));
}
