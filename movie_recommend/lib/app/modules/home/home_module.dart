import 'home_page_series/home_page_series_controller.dart';
import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_recommend/app/modules/choices/choices_controller.dart';
import 'package:movie_recommend/app/modules/search/search_controller.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomePageSeriesController,
        $HomePageSeriesController,
        $HomePageSeriesController,
        $HomeController,
        $ChoicesController,
        $SearchController
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => HomePage(
                  user: args.data,
                )),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
