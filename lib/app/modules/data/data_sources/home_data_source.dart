// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:dio/dio.dart';
import 'package:mobicar_app/app/modules/data/local/hive_client.dart';
import 'package:mobicar_app/app/modules/data/models/brand_model.dart';
import 'package:mobicar_app/app/modules/data/models/car_model.dart';
import 'package:mobicar_app/app/modules/data/models/model_model.dart';
import 'package:mobicar_app/app/modules/data/models/year_model.dart';
import 'package:mobicar_app/app/modules/domain/entities/brand_entity.dart';
import 'package:mobicar_app/app/modules/domain/entities/car_entity.dart';
import 'package:mobicar_app/app/modules/domain/entities/model_entity.dart';
import 'package:mobicar_app/app/modules/domain/entities/year_entity.dart';
import 'package:mobicar_app/app/modules/domain/errors/errors.dart';

abstract class HomeDatasource {
  Future<List<BrandEntity>> getBrands();
  Future<List<ModelEntity>> getModels(String codeModel);
  Future<List<YearEntity>> getYears(String codeBrand, String codeModel);
  Future<CarEntity> getSelectedCar(
      String codeBrand, String codeModel, String codeYear);
  Future<CarEntity?> saveSelectedCar(CarEntity selectedCar);
  Future<CarEntity?> getSaveSelectedCar(String keyCar);
  Future<List<CarEntity>> getSaveSelectedCarList();
  Future<void> deleteCar(String keyCar);
}

class HomeDatasourceImpl implements HomeDatasource {
  final Dio dio;
  final String baseUrl = "https://parallelum.com.br/fipe/api/v1";

  final HiveClient _hiveClient;
  static const String box = "Cars";

  String key = "key_cars";

  HomeDatasourceImpl(this.dio, this._hiveClient);

  @override
  Future<List<BrandEntity>> getBrands() async {
    List<BrandEntity> listBrands = [];

    var response = await dio.get("$baseUrl/carros/marcas");
    if (response.statusCode == 200) {
      var result = response.data as List;
      result.forEach((element) {
        listBrands.add(BrandModel.fromMap(element));
      });
      return listBrands;
    } else {
      throw Failure;
    }
  }

  @override
  Future<List<ModelEntity>> getModels(String codeModel) async {
    List<ModelEntity> listModels = [];

    var response = await dio.get("$baseUrl/carros/marcas/$codeModel/modelos");
    if (response.statusCode == 200) {
      var result = response.data['modelos'] as List;
      result.forEach((element) {
        listModels.add(ModelModel.fromMap(element));
      });
      return listModels;
    } else {
      throw Failure;
    }
  }

  @override
  Future<List<YearEntity>> getYears(String codeBrand, String codeModel) async {
    List<YearEntity> listYears = [];

    var response = await dio
        .get("$baseUrl/carros/marcas/$codeBrand/modelos/$codeModel/anos");
    if (response.statusCode == 200) {
      var result = response.data as List;
      result.forEach((element) {
        listYears.add(YearModel.fromMap(element));
      });
      return listYears;
    } else {
      throw Failure;
    }
  }

  @override
  Future<CarEntity> getSelectedCar(
      String codeBrand, String codeModel, String codeYear) async {
    var response = await dio.get(
        "$baseUrl/carros/marcas/$codeBrand/modelos/$codeModel/anos/$codeYear");
    if (response.statusCode == 200) {
      return CarModel.fromJson(response.data);
    } else {
      throw Failure;
    }
  }

  @override
  Future<CarEntity?> saveSelectedCar(CarEntity selectedCar) async {
    String keySelect =
        "${key}_${selectedCar.brand}_${selectedCar.model}_${selectedCar.yearModel.toString()}";

    List auxList = await _hiveClient.getAll(box);
    await _hiveClient.deleteAllBox();

    auxList.forEach((element) async {
      CarEntity car = CarModel.fromJson(Map<String, dynamic>.from(element));
      if ("${key}_${car.brand}_${car.model}_${car.yearModel.toString()}" !=
          keySelect) {
        await _hiveClient.put(
          box,
          "${key}_${car.brand}_${car.model}_${car.yearModel.toString()}",
          {
            "Valor": car.value,
            "Marca": car.brand,
            "Assessment": car.assessment,
            "Modelo": car.model,
            "AnoModelo": car.yearModel,
            "Combustivel": car.fuel,
            "CodigoFipe": car.fipeCode,
            "MesReferencia": car.referencyMonth,
            "TipoVeiculo": car.vehicleType,
            "SiglaCombustivel": car.fuelInitials
          },
        );
      }
    });

    await _hiveClient.put(
      box,
      keySelect,
      {
        "Valor": selectedCar.value,
        "Marca": selectedCar.brand,
        "Assessment": selectedCar.assessment,
        "Modelo": selectedCar.model,
        "AnoModelo": selectedCar.yearModel,
        "Combustivel": selectedCar.fuel,
        "CodigoFipe": selectedCar.fipeCode,
        "MesReferencia": selectedCar.referencyMonth,
        "TipoVeiculo": selectedCar.vehicleType,
        "SiglaCombustivel": selectedCar.fuelInitials
      },
    );
    return await getSaveSelectedCar(key);
  }

  @override
  Future<CarEntity?> getSaveSelectedCar(String keyCar) async {
    final result = await _hiveClient.get(box, keyCar);
    return result == null ? null : CarModel.fromJson(result);
  }

  @override
  Future<List<CarEntity>> getSaveSelectedCarList() async {
    List<CarEntity> listCar = [];
    List result = await _hiveClient.getAll(box);
    for (var car in result) {
      listCar.add(CarModel.fromJson(Map<String, dynamic>.from(car)));
    }
    return listCar;
  }

  @override
  Future<void> deleteCar(String keyCar) async {
    List auxList = await _hiveClient.getAll(box);

    await _hiveClient.deleteAllBox();
    auxList.forEach((element) async {
      CarEntity car = CarModel.fromJson(Map<String, dynamic>.from(element));

      if ("${key}_${car.brand}_${car.model}_${car.yearModel.toString()}" !=
          "${key}_$keyCar") {
        await saveSelectedCar(car);
      }
    });
  }
}
