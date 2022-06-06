// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:mobicar_app/app/modules/domain/entities/model_entity.dart';

class ModelModel extends ModelEntity {
  final String? nome;
  final int? codigo;

  const ModelModel({
    this.nome,
    this.codigo,
  }) : super(nome: nome, codigo: codigo);

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'codigo': codigo,
    };
  }

  static ModelModel fromMap(Map<String, dynamic> map) {
    return ModelModel(
      nome: map['nome'],
      codigo: map['codigo'],
    );
  }

  String toJson() => json.encode(toMap());

  static ModelModel fromJson(String source) => fromMap(json.decode(source));
}
