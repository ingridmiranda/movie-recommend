import 'package:movie_recommend/app/modules/movies/movie_recommended_page.dart';

import 'movies_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'movies_page.dart';

class MoviesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $MoviesController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => MoviesPage(chosenMovies: args.data)),
        ModularRouter("/movieRecommended", child: (_, args) => MovieRecommendedPage()),

      ];

  static Inject get to => Inject<MoviesModule>.of();
}
