import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobicar_app/app/modules/data/data_sources/home_data_source.dart';
import 'package:mobicar_app/app/modules/data/local/hive_client.dart';
import 'package:mobicar_app/app/modules/data/repositories/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:mobicar_app/app/modules/domain/usecases/delete_car_cases.dart';
import 'package:mobicar_app/app/modules/domain/usecases/get_brand_cases.dart';
import 'package:mobicar_app/app/modules/domain/usecases/get_model_use_cases.dart';
import 'package:mobicar_app/app/modules/domain/usecases/get_save_car_list_cases.dart';
import 'package:mobicar_app/app/modules/domain/usecases/get_selected_car_cases.dart';
import 'package:mobicar_app/app/modules/domain/usecases/get_year_use_cases.dart';
import 'package:mobicar_app/app/modules/domain/usecases/save_car_cases.dart';
import 'package:mobicar_app/app/modules/presenter/home/home_controller.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => HiveClient()),
        Bind((i) => HomeDatasourceImpl(i(), i())),
        Bind((i) => HomeRepositoryImpl(i())),
        Bind((i) => GetBrandUseCaseImpl(i())),
        Bind((i) => GetModelUseCaseImpl(i())),
        Bind((i) => GetYearUseCaseImpl(i())),
        Bind((i) => GetSelectedCarUseCaseImpl(i())),
        Bind((i) => SaveCarUseCaseImpl(i())),
        Bind((i) => GetSaveCarListUseCaseImpl(i())),
        Bind((i) => DeleteCarUseCaseImpl(i())),
        Bind((i) => HomeController(i(), i(), i(), i(), i(), i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const HomePage(),
          transition: TransitionType.leftToRight,
        ),
      ];
}
