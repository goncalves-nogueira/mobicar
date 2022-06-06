// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$_assessmentAtom = Atom(name: '_HomeController._assessment');

  @override
  int get _assessment {
    _$_assessmentAtom.reportRead();
    return super._assessment;
  }

  @override
  set _assessment(int value) {
    _$_assessmentAtom.reportWrite(value, super._assessment, () {
      super._assessment = value;
    });
  }

  final _$_brandSelectedAtom = Atom(name: '_HomeController._brandSelected');

  @override
  BrandEntity? get _brandSelected {
    _$_brandSelectedAtom.reportRead();
    return super._brandSelected;
  }

  @override
  set _brandSelected(BrandEntity? value) {
    _$_brandSelectedAtom.reportWrite(value, super._brandSelected, () {
      super._brandSelected = value;
    });
  }

  final _$_listBrandAtom = Atom(name: '_HomeController._listBrand');

  @override
  ObservableList<BrandEntity> get _listBrand {
    _$_listBrandAtom.reportRead();
    return super._listBrand;
  }

  @override
  set _listBrand(ObservableList<BrandEntity> value) {
    _$_listBrandAtom.reportWrite(value, super._listBrand, () {
      super._listBrand = value;
    });
  }

  final _$_modelSelectedAtom = Atom(name: '_HomeController._modelSelected');

  @override
  ModelEntity? get _modelSelected {
    _$_modelSelectedAtom.reportRead();
    return super._modelSelected;
  }

  @override
  set _modelSelected(ModelEntity? value) {
    _$_modelSelectedAtom.reportWrite(value, super._modelSelected, () {
      super._modelSelected = value;
    });
  }

  final _$_listModelAtom = Atom(name: '_HomeController._listModel');

  @override
  ObservableList<ModelEntity> get _listModel {
    _$_listModelAtom.reportRead();
    return super._listModel;
  }

  @override
  set _listModel(ObservableList<ModelEntity> value) {
    _$_listModelAtom.reportWrite(value, super._listModel, () {
      super._listModel = value;
    });
  }

  final _$_yearSelectedAtom = Atom(name: '_HomeController._yearSelected');

  @override
  YearEntity? get _yearSelected {
    _$_yearSelectedAtom.reportRead();
    return super._yearSelected;
  }

  @override
  set _yearSelected(YearEntity? value) {
    _$_yearSelectedAtom.reportWrite(value, super._yearSelected, () {
      super._yearSelected = value;
    });
  }

  final _$_listYearsAtom = Atom(name: '_HomeController._listYears');

  @override
  ObservableList<YearEntity> get _listYears {
    _$_listYearsAtom.reportRead();
    return super._listYears;
  }

  @override
  set _listYears(ObservableList<YearEntity> value) {
    _$_listYearsAtom.reportWrite(value, super._listYears, () {
      super._listYears = value;
    });
  }

  final _$_selectedCarAtom = Atom(name: '_HomeController._selectedCar');

  @override
  CarEntity get _selectedCar {
    _$_selectedCarAtom.reportRead();
    return super._selectedCar;
  }

  @override
  set _selectedCar(CarEntity value) {
    _$_selectedCarAtom.reportWrite(value, super._selectedCar, () {
      super._selectedCar = value;
    });
  }

  final _$_listCarSelectedAtom = Atom(name: '_HomeController._listCarSelected');

  @override
  ObservableList<CarEntity> get _listCarSelected {
    _$_listCarSelectedAtom.reportRead();
    return super._listCarSelected;
  }

  @override
  set _listCarSelected(ObservableList<CarEntity> value) {
    _$_listCarSelectedAtom.reportWrite(value, super._listCarSelected, () {
      super._listCarSelected = value;
    });
  }

  final _$setBrandSelectedAsyncAction =
      AsyncAction('_HomeController.setBrandSelected');

  @override
  Future<void> setBrandSelected(BrandEntity newBrand) {
    return _$setBrandSelectedAsyncAction
        .run(() => super.setBrandSelected(newBrand));
  }

  final _$getBrandsAsyncAction = AsyncAction('_HomeController.getBrands');

  @override
  Future<void> getBrands() {
    return _$getBrandsAsyncAction.run(() => super.getBrands());
  }

  final _$setModelSelectedAsyncAction =
      AsyncAction('_HomeController.setModelSelected');

  @override
  Future<void> setModelSelected(ModelEntity newModel) {
    return _$setModelSelectedAsyncAction
        .run(() => super.setModelSelected(newModel));
  }

  final _$getModelAsyncAction = AsyncAction('_HomeController.getModel');

  @override
  Future<void> getModel(String codeBrand) {
    return _$getModelAsyncAction.run(() => super.getModel(codeBrand));
  }

  final _$setYearSelectedAsyncAction =
      AsyncAction('_HomeController.setYearSelected');

  @override
  Future<void> setYearSelected(YearEntity newYear) {
    return _$setYearSelectedAsyncAction
        .run(() => super.setYearSelected(newYear));
  }

  final _$getYearsAsyncAction = AsyncAction('_HomeController.getYears');

  @override
  Future<void> getYears() {
    return _$getYearsAsyncAction.run(() => super.getYears());
  }

  final _$getSelectedCarAsyncAction =
      AsyncAction('_HomeController.getSelectedCar');

  @override
  Future<void> getSelectedCar() {
    return _$getSelectedCarAsyncAction.run(() => super.getSelectedCar());
  }

  final _$saveCarSelectedAsyncAction =
      AsyncAction('_HomeController.saveCarSelected');

  @override
  Future<void> saveCarSelected() {
    return _$saveCarSelectedAsyncAction.run(() => super.saveCarSelected());
  }

  final _$getSaveCarSelectedListAsyncAction =
      AsyncAction('_HomeController.getSaveCarSelectedList');

  @override
  Future<void> getSaveCarSelectedList() {
    return _$getSaveCarSelectedListAsyncAction
        .run(() => super.getSaveCarSelectedList());
  }

  final _$deleteCarAsyncAction = AsyncAction('_HomeController.deleteCar');

  @override
  Future<void> deleteCar(String keyCar) {
    return _$deleteCarAsyncAction.run(() => super.deleteCar(keyCar));
  }

  final _$setEditCarAsyncAction = AsyncAction('_HomeController.setEditCar');

  @override
  Future<void> setEditCar(CarEntity car) {
    return _$setEditCarAsyncAction.run(() => super.setEditCar(car));
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  void selectAssessment(int newValue) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.selectAssessment');
    try {
      return super.selectAssessment(newValue);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
