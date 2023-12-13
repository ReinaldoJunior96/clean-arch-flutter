import 'package:dartz/dartz.dart';
import 'package:sfmc_app/core/usecase/erros/failure.dart';
import 'package:sfmc_app/core/usecase/usecase.dart';
import 'package:sfmc_app/features/domain/entities/space_midia_entity.dart';
import 'package:sfmc_app/features/domain/repositories/space_midia_repository.dart';

class GetSpaceMediaUseCase implements Usecase<SpaceMediaEntity, NoParams> {
  final ISpaceMediaRepository repository;

  GetSpaceMediaUseCase({required this.repository});

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(NoParams params) async {
    return await repository.getSpaceMidiaFromDate();
  }
}
