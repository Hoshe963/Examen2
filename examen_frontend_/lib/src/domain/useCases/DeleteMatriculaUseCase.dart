import 'package:examen_frontend_/src/domain/repository/MatriculaRepository.dart';
import 'package:examen_frontend_/src/domain/utils/Resource.dart';

class DeleteMatriculaUseCase {
  final MatriculaRepository matriculaRepository;

  DeleteMatriculaUseCase(this.matriculaRepository);

  Future<Resource<bool>> call(int idMatricula) async {
    return await matriculaRepository.deleteMatricula(idMatricula);
  }
}
