import 'package:dartz/dartz.dart';
import 'package:mobicar_app/app/modules/data/data_sources/home_data_source.dart';
import 'package:mobicar_app/app/modules/domain/entities/brand_entity.dart';
import 'package:mobicar_app/app/modules/domain/entities/car_entity.dart';
import 'package:mobicar_app/app/modules/domain/entities/model_entity.dart';
import 'package:mobicar_app/app/modules/domain/entities/year_entity.dart';
import 'package:mobicar_app/app/modules/domain/errors/errors.dart';
import 'package:mobicar_app/app/modules/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource datasource;

  HomeRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<BrandEntity>>> getBrands() async {
    try {
      return Right(await datasource.getBrands());
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<ModelEntity>>> getModels(String codeModel) async {
    try {
      return Right(await datasource.getModels(codeModel));
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<YearEntity>>> getYears(
      String codeBrand, String codeModel) async {
    try {
      return Right(await datasource.getYears(codeBrand, codeModel));
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, CarEntity>> getSelectedCar(
      String codeBrand, String codeModel, String codeYear) async {
    try {
      return Right(
          await datasource.getSelectedCar(codeBrand, codeModel, codeYear));
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, CarEntity?>> saveCarSelected(
      CarEntity selctedCar) async {
    try {
      return Right(await datasource.saveSelectedCar(selctedCar));
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<CarEntity>?>> getSaveCarSelectedList() async {
    try {
      return Right(await datasource.getSaveSelectedCarList());
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteCar(String keyCar) async {
    try {
      return Right(await datasource.deleteCar(keyCar));
    } catch (e) {
      return Left(Failure());
    }
  }
}
