import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sfmc_app/core/usecase/erros/failure.dart';
//import 'package:sfmc_app/core/usecase/usecase.dart';
import 'package:sfmc_app/features/domain/entities/space_midia_entity.dart';
import 'package:sfmc_app/features/domain/entities/usecases/get_space_media_from_date_usecase.dart';
import 'package:sfmc_app/features/domain/repositories/space_midia_repository.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceMediaFromDateUseCase usecase;
  late ISpaceMediaRepository repository;

  setUp(() {
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaFromDateUseCase(repository: repository);
  });

  final tSpaceMedia = SpaceMediaEntity(
    description:
        "hat excites the Heart Nebula? First, the large emission nebula...",
    mediaType: 'image',
    title: 'images day',
    mediaUrl:
        'https://apod.nasa.gov/apod/image/2312/Heart_TelLiveOstling_960.jpg',
  );

  final tDate = DateTime(2023, 08, 09);

  test('should get media entity', () async {
    // Configurar o comportamento do repositório simulado
    when(() => repository.getSpaceMidiaFromDate(tDate))
        .thenAnswer((_) async => Right(tSpaceMedia));

    // Chamar o caso de uso com os parâmetros corretos
    final result = await usecase(tDate);

    // Verificar o resultado
    expect(result, Right(tSpaceMedia));

    // Verificar se o método no repositório foi chamado
    verify(() => repository.getSpaceMidiaFromDate(tDate)).called(1);
  });
  test('should return a  ServerFailure whe dont success', () async {
    when(() => repository.getSpaceMidiaFromDate(tDate))
        .thenAnswer((_) async => Left(ServerFailure()));

    final result = await usecase(tDate);
    expect(result, Left(ServerFailure()));
    verify(() => repository.getSpaceMidiaFromDate(tDate)).called(1);
  });
}
