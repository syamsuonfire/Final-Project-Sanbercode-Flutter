import 'package:finalproject_moviegames/app/modules/detail_game/bindings/detail_game_binding.dart';
import 'package:finalproject_moviegames/app/modules/detail_game/views/detail_game_view.dart';
import 'package:get/get.dart';

import '../modules/detail_movie/bindings/detail_movie_binding.dart';
import '../modules/detail_movie/views/detail_movie_view.dart';
import '../modules/games_tab/bindings/games_tab_binding.dart';
import '../modules/games_tab/views/games_tab_view.dart';
import '../modules/login_screen/bindings/login_screen_binding.dart';
import '../modules/login_screen/views/login_screen_view.dart';
import '../modules/main_screen/bindings/main_screen_binding.dart';
import '../modules/main_screen/views/main_screen_view.dart';
import '../modules/movies_tab/bindings/movies_tab_binding.dart';
import '../modules/movies_tab/views/movies_tab_view.dart';
import '../modules/profile_tab/bindings/profile_tab_binding.dart';
import '../modules/profile_tab/views/profile_tab_view.dart';
import '../modules/register_screen/bindings/register_screen_binding.dart';
import '../modules/register_screen/views/register_screen_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_SCREEN,
      page: () => MainScreenView(),
      binding: MainScreenBinding(),
    ),
    GetPage(
      name: _Paths.MOVIES_TAB,
      page: () => MoviesTabView(),
      binding: MoviesTabBinding(),
    ),
    GetPage(
      name: _Paths.GAMES_TAB,
      page: () => GamesTabView(),
      binding: GamesTabBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_TAB,
      page: () => ProfileTabView(),
      binding: ProfileTabBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_MOVIE,
      page: () => DetailMovieView(),
      binding: DetailMovieBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_SCREEN,
      page: () => RegisterScreenView(),
      binding: RegisterScreenBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_GAME,
      page: () => DetailGameView(),
      binding: DetailGameBinding(),
    ),
  ];
}
