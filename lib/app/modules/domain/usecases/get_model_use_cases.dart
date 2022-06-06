import 'package:dartz/dartz.dart';
import 'package:mobicar_app/app/modules/domain/entities/model_entity.dart';
import 'package:mobicar_app/app/modules/domain/errors/errors.dart';
import 'package:mobicar_app/app/modules/domain/repositories/home_repository.dart';

mixin GetModelUseCase {
  Future<Either<Failure, List<ModelEntity>>> call(String codeModel);
}

class GetModelUseCaseImpl implements GetModelUseCase {
  final HomeRepository repository;

  GetModelUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, List<ModelEntity>>> call(String codeModel) {
    return repository.getModels(codeModel);
  }
}
