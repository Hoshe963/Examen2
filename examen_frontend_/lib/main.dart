import 'package:examen_frontend_/src/domain/models/Matricula.dart';
import 'package:examen_frontend_/src/presentation/pages/listRoom/MatriculaListPage.dart';
import 'package:examen_frontend_/src/presentation/pages/listRoom/RegisterMatriculaPage.dart';
import 'package:examen_frontend_/injection.dart'; // Configuración de inyección
import 'package:examen_frontend_/src/presentation/pages/blocProviders.dart';
import 'package:flutter/material.dart'; // BlocProviders

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencias(); // Configura las dependencias
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders, // Proveer los BLoCs
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gestión de Matrículas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'matriculaListPage',
        routes: {
          'matriculaListPage': (context) => const MatriculaListPage(),
          'registerMatriculaPage': (context) => const RegisterMatriculaPage(),
          'editMatriculaPage': (context) => ModalRoute.of(context)!.settings.arguments != null
              ? RegisterMatriculaPage(matricula: ModalRoute.of(context)!.settings.arguments as Matricula)
              : const RegisterMatriculaPage(),
        },
      ),
    );
  }
}
