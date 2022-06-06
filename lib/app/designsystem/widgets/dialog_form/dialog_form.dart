import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobicar_app/app/designsystem/styles/app_color_scheme.dart';
import 'package:mobicar_app/app/designsystem/styles/app_text_theme.dart';
import 'package:mobicar_app/app/designsystem/widgets/button/mobicar_button.dart';
import 'package:mobicar_app/app/designsystem/widgets/button/variant_button.dart';
import 'package:mobicar_app/app/modules/domain/entities/brand_entity.dart';
import 'package:mobicar_app/app/modules/domain/entities/model_entity.dart';
import 'package:mobicar_app/app/modules/domain/entities/year_entity.dart';
import 'package:mobicar_app/app/modules/presenter/home/home_controller.dart';

class DialogForm extends StatelessWidget {
  const DialogForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.directions_car_rounded),
          const SizedBox(
            width: 10.0,
          ),
          const Expanded(
            child: Text(
              "Title",
              style: Helvetica700Font(fontSize: 16.0),
            ),
          ),
          IconButton(
            onPressed: () => Modular.to.pop(),
            icon: const Icon(Icons.close_rounded),
          )
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 4.0, left: 4.0),
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://s2.glbimg.com/BjYN0oeb45ic1gsdmPjFzdUMFhs=/321x546:3835x2731/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2020/6/Y/dmBD1jSuSR0BZVcqYXtw/ford-ka-hatch-2020-dianteira-estatica.jpeg"),
              ),
            ),
            child: Observer(
              builder: (_) {
                return Row(
                  children: [1, 2, 3, 4, 5]
                      .map((e) => InkWell(
                            onTap: () => controller.selectAssessment(e),
                            child: Icon(
                              Icons.star_rounded,
                              size: 22.0,
                              color: controller.assessment >= e
                                  ? AppColorScheme.WARNING_YELLOW_6_COLOR
                                  : AppColorScheme.NEUTRAL_GREY_2_COLOR,
                            ),
                          ))
                      .toList(),
                );
              },
            ),
          ),
          Observer(
            builder: (_) {
              return controller.isFormLoad()
                  ? const Padding(
                      padding: EdgeInsets.only(top: 24.0),
                      child: CircularProgressIndicator(
                        color: AppColorScheme.NEUTRAL_GREY_10_COLOR,
                      ),
                    )
                  : Column(
                      children: [
                        DropdownButton<BrandEntity>(
                          borderRadius: BorderRadius.circular(4.0),
                          value: controller.brandSelected,
                          isExpanded: true,
                          icon: const Icon(
                            Icons.arrow_drop_down_rounded,
                            color: AppColorScheme.NEUTRAL_GREY_8_COLOR,
                          ),
                          iconSize: 32.0,
                          style: const TextStyle(color: Colors.deepPurple),
                          onChanged: (BrandEntity? newBrand) {
                            controller.setBrandSelected(newBrand!);
                          },
                          items: controller.listBrand
                              .map<DropdownMenuItem<BrandEntity>>(
                                  (BrandEntity value) {
                            return DropdownMenuItem<BrandEntity>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  value.nome!,
                                  style: const Helvetica400Font(
                                      color:
                                          AppColorScheme.NEUTRAL_GREY_8_COLOR),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        DropdownButton<ModelEntity>(
                          borderRadius: BorderRadius.circular(4.0),
                          value: controller.modelSelected,
                          isExpanded: true,
                          icon: const Icon(
                            Icons.arrow_drop_down_rounded,
                            color: AppColorScheme.NEUTRAL_GREY_8_COLOR,
                          ),
                          iconSize: 32.0,
                          style: const TextStyle(color: Colors.deepPurple),
                          onChanged: (ModelEntity? newModel) {
                            controller.setModelSelected(newModel!);
                          },
                          items: controller.listModel
                              .map<DropdownMenuItem<ModelEntity>>(
                                  (ModelEntity value) {
                            return DropdownMenuItem<ModelEntity>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  value.nome!,
                                  style: const Helvetica400Font(
                                      color:
                                          AppColorScheme.NEUTRAL_GREY_8_COLOR),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        DropdownButton<YearEntity>(
                          borderRadius: BorderRadius.circular(4.0),
                          value: controller.yearSelected,
                          isExpanded: true,
                          icon: const Icon(
                            Icons.arrow_drop_down_rounded,
                            color: AppColorScheme.NEUTRAL_GREY_8_COLOR,
                          ),
                          iconSize: 32.0,
                          style: const TextStyle(color: Colors.deepPurple),
                          onChanged: (YearEntity? newYear) {
                            controller.setYearSelected(newYear!);
                          },
                          items: controller.listYears
                              .map<DropdownMenuItem<YearEntity>>(
                                  (YearEntity value) {
                            return DropdownMenuItem<YearEntity>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  value.nome!,
                                  style: const Helvetica400Font(
                                    color: AppColorScheme.NEUTRAL_GREY_8_COLOR,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 4.0),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                  width: 1,
                                  color: AppColorScheme.NEUTRAL_GREY_9_COLOR)),
                          child: Text(
                            controller.selectedCar.value!,
                            style: const Helvetica400Font(
                              color: AppColorScheme.NEUTRAL_GREY_8_COLOR,
                            ),
                          ),
                        )
                      ],
                    );
            },
          )
        ],
      ),
      actions: [
        Observer(builder: (_) {
          return controller.isFormLoad()
              ? Container()
              : MobicarButton(
                  text: "Cancelar",
                  onPressed: () => Modular.to.pop(),
                  variant: ButtonVariant.second,
                );
        }),
        Observer(builder: (_) {
          return controller.isFormLoad()
              ? Container()
              : MobicarButton(
                  text: "Salvar",
                  onPressed: () async {
                    await controller.saveCarSelected();
                    Modular.to.pop();
                  },
                  variant: ButtonVariant.primary,
                );
        }),
      ],
    );
  }
}
