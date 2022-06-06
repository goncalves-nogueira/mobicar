import 'package:dartz/dartz.dart';
import 'package:mobicar_app/app/modules/domain/errors/errors.dart';
import 'package:mobicar_app/app/modules/domain/repositories/home_repository.dart';

mixin DeleteCarUseCase {
  Future<Either<Failure, void>> call(String keyCar);
}

class DeleteCarUseCaseImpl implements DeleteCarUseCase {
  final HomeRepository repository;

  DeleteCarUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, void>> call(String keyCar) {
    return repository.deleteCar(keyCar);
  }
}
