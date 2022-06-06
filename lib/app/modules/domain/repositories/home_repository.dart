import 'package:dartz/dartz.dart';
import 'package:mobicar_app/app/modules/domain/entities/brand_entity.dart';
import 'package:mobicar_app/app/modules/domain/entities/car_entity.dart';
import 'package:mobicar_app/app/modules/domain/entities/model_entity.dart';
import 'package:mobicar_app/app/modules/domain/entities/year_entity.dart';
import 'package:mobicar_app/app/modules/domain/errors/errors.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<BrandEntity>>> getBrands();
  Future<Either<Failure, List<ModelEntity>>> getModels(String codeBrand);
  Future<Either<Failure, List<YearEntity>>> getYears(
      String codeBrand, String codeModel);
  Future<Either<Failure, CarEntity>> getSelectedCar(
      String codeBrand, String codeModel, String codeYear);
  Future<Either<Failure, CarEntity?>> saveCarSelected(CarEntity selctedCar);
  Future<Either<Failure, List<CarEntity>?>> getSaveCarSelectedList();
  Future<Either<Failure, void>> deleteCar(String keyCar);
}
