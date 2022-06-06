// ignore_for_file: annotate_overrides, overridden_fields, prefer_collection_literals
import 'package:mobicar_app/app/modules/domain/entities/car_entity.dart';

class CarModel extends CarEntity {
  final String? value;
  final String? brand;
  final int? assessment;
  final String? model;
  final int? yearModel;
  final String? fuel;
  final String? fipeCode;
  final String? referencyMonth;
  final int? vehicleType;
  final String? fuelInitials;

  const CarModel({
    this.value,
    this.brand,
    this.assessment,
    this.model,
    this.yearModel,
    this.fuel,
    this.fipeCode,
    this.referencyMonth,
    this.vehicleType,
    this.fuelInitials,
  }) : super(
          value: value,
          brand: brand,
          assessment: assessment,
          model: model,
          yearModel: yearModel,
          fuel: fuel,
          fipeCode: fipeCode,
          referencyMonth: referencyMonth,
          vehicleType: vehicleType,
          fuelInitials: fuelInitials,
        );

  static CarModel fromJson(Map<String, dynamic> json) {
    return CarModel(
      value: json['Valor'],
      brand: json['Marca'],
      assessment: json['Assessment'],
      model: json['Modelo'],
      yearModel: json['AnoModelo'],
      fuel: json['Combustivel'],
      fipeCode: json['CodigoFipe'],
      referencyMonth: json['MesReferencia'],
      vehicleType: json['TipoVeiculo'],
      fuelInitials: json['SiglaCombustivel'],
    );
  }

  static Map<String, dynamic> toJson(CarEntity carEntity) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Valor'] = carEntity.value;
    data['Marca'] = carEntity.brand;
    data['Assessment'] = carEntity.assessment;
    data['Modelo'] = carEntity.model;
    data['AnoModelo'] = carEntity.yearModel;
    data['Combustivel'] = carEntity.fuel;
    data['CodigoFipe'] = carEntity.fipeCode;
    data['MesReferencia'] = carEntity.referencyMonth;
    data['TipoVeiculo'] = carEntity.vehicleType;
    data['SiglaCombustivel'] = carEntity.fuelInitials;
    return data;
  }
}
