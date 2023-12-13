import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sfmc_app/core/usecase/usecase.dart';
import 'package:sfmc_app/features/domain/entities/space_midia_entity.dart';
import 'package:sfmc_app/features/domain/entities/usecases/get_space_media_usecase.dart';
import 'package:sfmc_app/features/domain/repositories/space_midia_repository.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceMediaUseCase usecase;
  late ISpaceMediaRepository repository;

  setUp(() {
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaUseCase(repository: repository);
  });

  final tSpaceMedia = SpaceMediaEntity(
    description:
        "hat excites the Heart Nebula? First, the large emission nebula...",
    mediaType: 'image',
    title: 'images day',
    mediaUrl:
        'https://apod.nasa.gov/apod/image/2312/Heart_TelLiveOstling_960.jpg',
  );

  final tNoParams = NoParams();

  test('should get media entity', () async {
    // Configurar o comportamento do repositório simulado
    when(() => repository.getSpaceMidiaFromDate())
        .thenAnswer((_) async => Right(tSpaceMedia));

    // Chamar o caso de uso com os parâmetros corretos
    final result = await usecase(tNoParams);

    // Verificar o resultado
    expect(result, Right(tSpaceMedia));

    // Verificar se o método no repositório foi chamado
    verify(() => repository.getSpaceMidiaFromDate()).called(1);
  });
}
