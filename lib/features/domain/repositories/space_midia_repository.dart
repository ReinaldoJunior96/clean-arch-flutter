import 'package:sfmc_app/core/usecase/erros/failure.dart';
import 'package:sfmc_app/features/domain/entities/space_midia_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ISpaceMediaRepository {
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMidiaFromDate(
      DateTime date);
}
