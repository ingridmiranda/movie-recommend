import 'movies_splash_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'movies_splash_page.dart';

class MoviesSplashModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $MoviesSplashController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => MoviesSplashPage(argumentos: args.data)),
      ];

  static Inject get to => Inject<MoviesSplashModule>.of();
}
