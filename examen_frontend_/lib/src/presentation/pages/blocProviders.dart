import 'package:examen_frontend_/src/domain/useCases/CreateMatriculaUseCase.dart';
import 'package:examen_frontend_/src/domain/useCases/DeleteMatriculaUseCase.dart';
import 'package:examen_frontend_/src/domain/useCases/FetchMatriculaUseCase.dart';
import 'package:examen_frontend_/src/domain/useCases/UpdateMatriculaUseCase.dart';
import 'package:examen_frontend_/src/presentation/pages/listRoom/bloc/MatriculaBloc.dart';
import 'package:examen_frontend_/src/presentation/pages/listRoom/bloc/MatriculaEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:examen_frontend_/injection.dart'; // Importa la configuración de inyección

List<BlocProviders> blocProviders = [
  BlocProvider<MatriculaBloc>(
    create: (context) => MatriculaBloc(
      fetchMatriculasUseCase: locator<FetchMatriculasUseCase>(),
      createMatriculaUseCase: locator<CreateMatriculaUseCase>(),
      updateMatriculaUseCase: locator<UpdateMatriculaUseCase>(),
      deleteMatriculaUseCase: locator<DeleteMatriculaUseCase>(),
    )..add(FetchMatriculasEvent()), // Evento inicial para cargar las matrículas
  ),
  // Agrega más BlocProviders si es necesario
];
