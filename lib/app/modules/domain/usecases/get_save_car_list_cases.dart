import 'package:dartz/dartz.dart';
import 'package:mobicar_app/app/modules/domain/entities/car_entity.dart';
import 'package:mobicar_app/app/modules/domain/errors/errors.dart';
import 'package:mobicar_app/app/modules/domain/repositories/home_repository.dart';

mixin GetSaveCarListUseCase {
  Future<Either<Failure, List<CarEntity>?>> call();
}

class GetSaveCarListUseCaseImpl implements GetSaveCarListUseCase {
  final HomeRepository repository;

  GetSaveCarListUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, List<CarEntity>?>> call() {
    return repository.getSaveCarSelectedList();
  }
}
