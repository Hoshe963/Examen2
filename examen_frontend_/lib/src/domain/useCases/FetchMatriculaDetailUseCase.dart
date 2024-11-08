import 'package:examen_frontend_/src/domain/models/Matricula.dart';
import 'package:examen_frontend_/src/domain/repository/MatriculaRepository.dart';
import 'package:examen_frontend_/src/domain/utils/Resource.dart';

class FetchMatriculaDetailUseCase {
  final MatriculaRepository matriculaRepository;

  FetchMatriculaDetailUseCase(this.matriculaRepository);

  Future<Resource<Matricula>> call(int idMatricula) async {
    return await matriculaRepository.fetchMatriculaDetail(idMatricula);
  }
}
