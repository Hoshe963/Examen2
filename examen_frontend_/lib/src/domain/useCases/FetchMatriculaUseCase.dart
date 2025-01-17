import 'package:examen_frontend_/src/domain/models/Matricula.dart';
import 'package:examen_frontend_/src/domain/repository/MatriculaRepository.dart';
import 'package:examen_frontend_/src/domain/utils/Resource.dart';

class FetchMatriculasUseCase {
  final MatriculaRepository matriculaRepository;

  FetchMatriculasUseCase(this.matriculaRepository);

  Future<Resource<List<Matricula>>> call() async {
    return await matriculaRepository.fetchMatriculas();
  }
}
