import 'package:flutter/material.dart';
import 'package:movie_app/bloc/theme_bloc/theme_controller.dart';
import 'package:movie_app/bloc/theme_bloc/theme_service.dart';
import 'package:movie_app/consts/app_themes.dart';
import 'package:movie_app/services/movie_repository.dart';
import 'package:movie_app/views/pages/main_screen.dart';

/*void main() {
  runApp(const MyApp());
}*/

void main() async {
  final movieRepository = MovieRepository();
  final themeController = ThemeController(ThemeService());
  await themeController.loadSettings();
  runApp(MyApp(
    themeController: themeController,
    movieRepository: movieRepository,
  ));
}


class MyApp extends StatelessWidget {
  const MyApp(
      {Key? key, required this.themeController, required this.movieRepository})
      : super(key: key);

  final ThemeController themeController;
  final MovieRepository movieRepository;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeController.themeMode,
          home: MainScreen(
            themeController: themeController,
            movieRepository: movieRepository,
          ),
        );
      },
    );
  }
}