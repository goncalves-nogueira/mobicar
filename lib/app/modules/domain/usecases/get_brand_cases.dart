import 'package:dartz/dartz.dart';
import 'package:mobicar_app/app/modules/domain/entities/brand_entity.dart';
import 'package:mobicar_app/app/modules/domain/errors/errors.dart';
import 'package:mobicar_app/app/modules/domain/repositories/home_repository.dart';

mixin GetBrandUseCase {
  Future<Either<Failure, List<BrandEntity>>> call();
}

class GetBrandUseCaseImpl implements GetBrandUseCase {
  final HomeRepository repository;

  GetBrandUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, List<BrandEntity>>> call() {
    return repository.getBrands();
  }
}
