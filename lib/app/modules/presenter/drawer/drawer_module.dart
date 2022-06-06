import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobicar_app/app/modules/presenter/drawer/drawer_page.dart';

class DrawerModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const DrawerPage(),
          transition: TransitionType.rightToLeft,
        ),
      ];
}
