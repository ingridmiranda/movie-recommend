import 'package:movie_recommend/app/modules/search/list/list_controller.dart';
import 'package:movie_recommend/app/modules/search/search_page.dart';
import 'package:movie_recommend/app/modules/search/search_controller.dart';

import 'modules/error_movie/error_movie_controller.dart';
import 'modules/about_us/about_us_controller.dart';
import 'modules/about_us/about_us_page.dart';
import 'package:movie_recommend/app/modules/choices/actors/actors_controller.dart';
import 'package:movie_recommend/app/modules/choices/actors/actors_page.dart';
import 'package:movie_recommend/app/modules/choices/choices_module.dart';
import 'package:movie_recommend/app/modules/choices/list_actors/list_actors_controller.dart';
import 'package:movie_recommend/app/modules/choices/list_actors/list_actors_page.dart';
import 'package:movie_recommend/app/modules/choices/movie_genres/movie_genres_page.dart';
import 'package:movie_recommend/app/modules/login/login_module.dart';
import 'package:movie_recommend/app/modules/home/home_page_series/home_page_series_controller.dart';
import 'package:movie_recommend/app/modules/home/home_page_series/home_page_series_module.dart';
import 'package:movie_recommend/app/modules/movies/movies_page.dart';
import 'package:movie_recommend/app/modules/movies/movie_recommended_page.dart';
import 'package:movie_recommend/app/modules/movies/movies_splash/movies_splash_module.dart';
import 'package:movie_recommend/app/modules/onboard/onboard_page.dart';
import 'package:movie_recommend/shared/services/hive_storage_service.dart';
import 'package:movie_recommend/app/modules/choices/movie_genres/movie_genres_controller.dart';
import 'modules/onboard/onboard_controller.dart';
import 'modules/movies/movies_controller.dart';
import 'modules/serie/serie_controller.dart';
import 'modules/serie/serie_page.dart';
import 'modules/serie/serie_recommended_page.dart';
import 'package:movie_recommend/app/modules/splash/splash_page.dart';
import 'package:movie_recommend/app/modules/error_movie/error_movie_page.dart';
import 'package:movie_recommend/app/modules/error_movie/error_movie_controller.dart';
import 'package:movie_recommend/app/modules/search/list/list_page.dart';
import 'modules/splash/splash_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:movie_recommend/app/app_widget.dart';
import 'package:movie_recommend/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [$ErrorMovieController,
        $AboutUsController,
        $ListActorsController,
        $ActorsController,
        $OnboardController,
        $SplashController,
        $MovieGenresController,
        $MoviesController,
        $SerieController,
        $HomePageSeriesController,
        $ListController,
        $SearchController,
        BindInject((i) => HiveStorageService())
      ];
  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashPage()),
        ModularRouter("/aboutUs", child: (_, args) => AboutUsPage()),
        ModularRouter("/errorMovie", child: (_, args) => ErrorMoviePage()),
        ModularRouter("/onboard", child: (_, args) => OnboardPage()),
        ModularRouter("/home", module: HomeModule()),
        ModularRouter("/homeSeries", module: HomePageSeriesModule()),
        ModularRouter("/login", module: LoginModule()),
        ModularRouter("/choices", module: ChoicesModule()),
        ModularRouter("/search", child: (_, args) => SearchPage()),
        ModularRouter("/listSearch", 
            child: (_, args) => ListPage(search: args.data)),
        ModularRouter("/moviegenres",
            child: (_, args) => MovieGenresPage(isMovie: args.data)),
        ModularRouter("/actors",
            child: (_, args) => ActorsPage(
                  argumentos: args.data,
                )),
        ModularRouter("/selectactors",
            child: (_, args) => ListActorsPage(
                  argumentos: args.data,
                )),
        ModularRouter("/movies", child: (_, args) => MoviesPage(chosenMovies: args.data)),
        ModularRouter("/movieRecommended", child: (_, args) => MovieRecommendedPage(chosenMovies: args.data)),
        ModularRouter("/series",child: (_, args) => SeriePage(chosenSerie: args.data)),
        ModularRouter("/splashMovie", module: MoviesSplashModule()),
        ModularRouter("/serieRecommended", child: (_, args) => SerieRecommendedPage(chosenSerie: args.data)),

      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
