import 'package:dartz/dartz.dart';
import 'package:mobicar_app/app/modules/domain/entities/car_entity.dart';
import 'package:mobicar_app/app/modules/domain/errors/errors.dart';
import 'package:mobicar_app/app/modules/domain/repositories/home_repository.dart';

mixin GetSelectedCarUseCase {
  Future<Either<Failure, CarEntity>> call(
      String codeBrand, String codeModel, String codeYear);
}

class GetSelectedCarUseCaseImpl implements GetSelectedCarUseCase {
  final HomeRepository repository;

  GetSelectedCarUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, CarEntity>> call(
      String codeBrand, String codeModel, String codeYear) {
    return repository.getSelectedCar(codeBrand, codeModel, codeYear);
  }
}
