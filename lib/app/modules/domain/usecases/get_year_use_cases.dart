import 'package:dartz/dartz.dart';
import 'package:mobicar_app/app/modules/domain/entities/year_entity.dart';
import 'package:mobicar_app/app/modules/domain/errors/errors.dart';
import 'package:mobicar_app/app/modules/domain/repositories/home_repository.dart';

mixin GetYearUseCase {
  Future<Either<Failure, List<YearEntity>>> call(
      String codeBrand, String codeModel);
}

class GetYearUseCaseImpl implements GetYearUseCase {
  final HomeRepository repository;

  GetYearUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, List<YearEntity>>> call(
      String codeBrand, String codeModel) {
    return repository.getYears(codeBrand, codeModel);
  }
}
