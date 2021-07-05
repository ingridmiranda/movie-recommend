import 'search_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_recommend/app/modules/search/list/list_controller.dart';
import 'search_home_page.dart';
import 'search_page.dart';

class SearchModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $SearchController,
        $ListController
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SearchPage()),
        ModularRouter("/searchHome", child: (_, args) => SearchHomePage()),      
      ];

  static Inject get to => Inject<SearchModule>.of();
}
