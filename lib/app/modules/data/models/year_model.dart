// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:mobicar_app/app/modules/domain/entities/year_entity.dart';

class YearModel extends YearEntity {
  final String nome;
  final String codigo;

  const YearModel({
    required this.nome,
    required this.codigo,
  }) : super(nome: nome, codigo: codigo);

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'codigo': codigo,
    };
  }

  static YearModel fromMap(Map<String, dynamic> map) {
    return YearModel(
      nome: map['nome'],
      codigo: map['codigo'],
    );
  }

  String toJson() => json.encode(toMap());

  static YearModel fromJson(String source) => fromMap(json.decode(source));
}
