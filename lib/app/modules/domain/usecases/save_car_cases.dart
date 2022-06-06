import 'package:dartz/dartz.dart';
import 'package:mobicar_app/app/modules/domain/entities/car_entity.dart';
import 'package:mobicar_app/app/modules/domain/errors/errors.dart';
import 'package:mobicar_app/app/modules/domain/repositories/home_repository.dart';

mixin SaveCarUseCase {
  Future<Either<Failure, CarEntity?>> call(CarEntity carSelected);
}

class SaveCarUseCaseImpl implements SaveCarUseCase {
  final HomeRepository repository;

  SaveCarUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, CarEntity?>> call(CarEntity carSelected) {
    return repository.saveCarSelected(carSelected);
  }
}
