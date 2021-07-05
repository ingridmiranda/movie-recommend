import 'package:movie_recommend/app/modules/search/search_controller.dart';

import 'list_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'list_page.dart';

class ListModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ListController,
        $SearchController
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ListPage(search: args.data)),
      ];

  static Inject get to => Inject<ListModule>.of();
}
