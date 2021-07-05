import 'serie_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'serie_recommended_page.dart';

import 'serie_page.dart';

class SerieModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $SerieController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SeriePage(chosenSerie: args.data)),
        ModularRouter("/serieRecommended", child: (_, args) => SerieRecommendedPage()),

      ];

  static Inject get to => Inject<SerieModule>.of();
}
