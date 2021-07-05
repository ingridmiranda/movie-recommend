import 'home_page_series_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_recommend/app/modules/choices/choices_controller.dart';


import 'home_page_series_page.dart';

class HomePageSeriesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomePageSeriesController,
        $ChoicesController

      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => HomePageSeriesPage(
              user: args.data,
            )),
      ];

  static Inject get to => Inject<HomePageSeriesModule>.of();
}
