import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobicar_app/app/modules/presenter/drawer/drawer_module.dart';
import 'package:mobicar_app/app/modules/presenter/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute("/", module: HomeModule()),
        ModuleRoute("/drawer", module: DrawerModule()),
      ];
}
