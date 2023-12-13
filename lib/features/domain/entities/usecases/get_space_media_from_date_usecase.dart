import 'package:dartz/dartz.dart';
import 'package:sfmc_app/core/usecase/erros/failure.dart';
import 'package:sfmc_app/core/usecase/usecase.dart';
import 'package:sfmc_app/features/domain/entities/space_midia_entity.dart';
import 'package:sfmc_app/features/domain/repositories/space_midia_repository.dart';

class GetSpaceMediaFromDateUseCase
    implements Usecase<SpaceMediaEntity, DateTime> {
  final ISpaceMediaRepository repository;

  GetSpaceMediaFromDateUseCase({required this.repository});

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime date) async {
    return await repository.getSpaceMidiaFromDate(date);
  }
}
