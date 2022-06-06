// ignore_for_file: prefer_final_fields, avoid_print

import 'package:mobicar_app/app/modules/domain/entities/brand_entity.dart';
import 'package:mobicar_app/app/modules/domain/entities/car_entity.dart';
import 'package:mobicar_app/app/modules/domain/entities/model_entity.dart';
import 'package:mobicar_app/app/modules/domain/entities/year_entity.dart';
import 'package:mobicar_app/app/modules/domain/usecases/delete_car_cases.dart';
import 'package:mobicar_app/app/modules/domain/usecases/get_brand_cases.dart';
import 'package:mobicar_app/app/modules/domain/usecases/get_model_use_cases.dart';
import 'package:mobicar_app/app/modules/domain/usecases/get_save_car_list_cases.dart';
import 'package:mobicar_app/app/modules/domain/usecases/get_selected_car_cases.dart';
import 'package:mobicar_app/app/modules/domain/usecases/get_year_use_cases.dart';
import 'package:mobicar_app/app/modules/domain/usecases/save_car_cases.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final GetBrandUseCase getBrandUseCase;
  final GetModelUseCase getModelUseCase;
  final GetYearUseCase getYearUseCase;
  final GetSelectedCarUseCase getSelectedCarUseCase;
  final SaveCarUseCase saveCarUseCase;
  final GetSaveCarListUseCase getSaveCarUseCaseList;
  final DeleteCarUseCase deleteCarUseCase;

  _HomeController(
    this.getBrandUseCase,
    this.getModelUseCase,
    this.getYearUseCase,
    this.getSelectedCarUseCase,
    this.saveCarUseCase,
    this.getSaveCarUseCaseList,
    this.deleteCarUseCase,
  );

  String _retroKey = "";
  String get retroKey => _retroKey;

  @observable
  int _assessment = 0;
  int get assessment => _assessment;

  @action
  void selectAssessment(int newValue) {
    if (newValue == 1 && assessment == 1) {
      _assessment = 0;
    } else {
      _assessment = newValue;
    }
  }

  @observable
  BrandEntity? _brandSelected;
  BrandEntity get brandSelected => _brandSelected!;

  @observable
  ObservableList<BrandEntity> _listBrand = ObservableList();
  ObservableList<BrandEntity> get listBrand => _listBrand;

  @action
  Future<void> setBrandSelected(BrandEntity newBrand) async {
    _brandSelected = newBrand;
    await getModel(brandSelected.codigo!);
  }

  @action
  Future<void> getBrands() async {
    var response = await getBrandUseCase();
    response.fold((l) => null, (r) async {
      _brandSelected = r[0];
      _listBrand.clear();
      _listBrand.addAll(r);
      await getModel(brandSelected.codigo!);
    });
  }

  @observable
  ModelEntity? _modelSelected;
  ModelEntity get modelSelected => _modelSelected!;

  @observable
  ObservableList<ModelEntity> _listModel = ObservableList();
  ObservableList<ModelEntity> get listModel => _listModel;

  @action
  Future<void> setModelSelected(ModelEntity newModel) async {
    _modelSelected = newModel;
    await getYears();
  }

  @action
  Future<void> getModel(String codeBrand) async {
    selectAssessment(0);
    _listModel.clear();
    var response = await getModelUseCase(codeBrand);
    response.fold((l) => null, (r) async {
      _modelSelected = r[0];
      _listModel.clear();
      _listModel.addAll(r);
      await getYears();
    });
  }

  @observable
  YearEntity? _yearSelected;
  YearEntity get yearSelected => _yearSelected!;

  @observable
  ObservableList<YearEntity> _listYears = ObservableList();
  ObservableList<YearEntity> get listYears => _listYears;

  @action
  Future<void> setYearSelected(YearEntity newYear) async {
    _yearSelected = newYear;
    await getSelectedCar();
  }

  @action
  Future<void> getYears() async {
    selectAssessment(0);
    _listYears.clear();
    var response = await getYearUseCase(
        _brandSelected!.codigo!, _modelSelected!.codigo!.toString());
    response.fold((l) => print("erro"), (r) async {
      _yearSelected = r[0];
      _listYears.clear();
      _listYears.addAll(r);
      getSelectedCar();
    });
  }

  @observable
  CarEntity _selectedCar = const CarEntity(value: "0");
  CarEntity get selectedCar => _selectedCar;

  @action
  Future<void> getSelectedCar() async {
    selectAssessment(0);
    _selectedCar = const CarEntity(value: "0");
    var response = await getSelectedCarUseCase(
      _brandSelected!.codigo!,
      _modelSelected!.codigo!.toString(),
      _yearSelected!.codigo!,
    );
    response.fold((l) => print("erro"), (r) {
      _selectedCar = r;
    });
  }

  bool isFormLoad() {
    return listBrand.isEmpty ||
            listModel.isEmpty ||
            listYears.isEmpty ||
            selectedCar.value == "0"
        ? true
        : false;
  }

  @action
  Future<void> saveCarSelected() async {
    if (retroKey != "") {
      await deleteCar(retroKey);
    }

    var response = await saveCarUseCase(
      CarEntity(
          brand: _selectedCar.brand,
          model: _selectedCar.model,
          yearModel: _selectedCar.yearModel,
          assessment: assessment,
          fipeCode: _selectedCar.fipeCode,
          fuel: _selectedCar.fuel,
          fuelInitials: _selectedCar.fuelInitials,
          referencyMonth: _selectedCar.referencyMonth,
          value: _selectedCar.value,
          vehicleType: _selectedCar.vehicleType),
    );
    response.fold((l) => print("erro"), (r) async {
      await getSaveCarSelectedList();
    });
  }

  @observable
  ObservableList<CarEntity> _listCarSelected = ObservableList();
  ObservableList<CarEntity> get listCarSelected => _listCarSelected;

  @action
  Future<void> getSaveCarSelectedList() async {
    var response = await getSaveCarUseCaseList();
    response.fold((l) => print("erro"), (r) {
      _listCarSelected.clear();
      _listCarSelected.addAll(r!);
    });
  }

  @action
  Future<void> deleteCar(String keyCar) async {
    var response = await deleteCarUseCase(keyCar);
    response.fold((l) async {
      await getSaveCarSelectedList();
    }, (r) async {
      await getSaveCarSelectedList();
    });
  }

  @action
  Future<void> setEditCar(CarEntity car) async {
    _retroKey = "${car.brand}_${car.model}_${car.yearModel.toString()}";

    await getBrands();

    for (var item in listBrand) {
      if (item.nome == car.brand) {
        await setBrandSelected(item);
      }
    }

    for (var item in listModel) {
      if (item.nome == car.model) {
        await setModelSelected(item);
      }
    }

    for (var item in listYears) {
      if (item.nome == car.yearModel.toString()) {
        await setYearSelected(item);
      }
    }

    selectAssessment(car.assessment!);
  }
}
