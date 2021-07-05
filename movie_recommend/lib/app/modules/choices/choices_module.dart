import 'list_actors/list_actors_controller.dart';
import 'actors/actors_controller.dart';
import 'movie_genres/movie_genres_controller.dart';
import 'choices_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'choices_home_page.dart';
import 'choices_page.dart';

class ChoicesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ListActorsController,
        $ActorsController,
        $MovieGenresController,
        $ChoicesController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ChoicesPage()),
        ModularRouter("/choicesHome", child: (_, args) => ChoicesHomePage()),
      ];

  static Inject get to => Inject<ChoicesModule>.of();
}
