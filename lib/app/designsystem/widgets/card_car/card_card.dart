import 'package:flutter/material.dart';
import 'package:mobicar_app/app/designsystem/styles/app_color_scheme.dart';
import 'package:mobicar_app/app/designsystem/styles/app_text_theme.dart';
import 'package:mobicar_app/app/designsystem/widgets/dialog_form/dialog_form.dart';
import 'package:mobicar_app/app/designsystem/widgets/dialog_view/dialog_view.dart';
import 'package:mobicar_app/app/modules/domain/entities/car_entity.dart';
import 'package:mobicar_app/app/modules/presenter/home/home_controller.dart';

class CardCar extends StatelessWidget {
  final HomeController? controller;
  final CarEntity? car;

  const CardCar({Key? key, this.controller, this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 100;
    final width = MediaQuery.of(context).size.width / 100;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: AppColorScheme.NEUTRAL_GREY_10_COLOR,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: height * 6,
            width: width * 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://s2.glbimg.com/BjYN0oeb45ic1gsdmPjFzdUMFhs=/321x546:3835x2731/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2020/6/Y/dmBD1jSuSR0BZVcqYXtw/ford-ka-hatch-2020-dianteira-estatica.jpeg"),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car!.model!,
                    style: const Helvetica700Font(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                      car!.yearModel.toString(),
                      style: const Helvetica400Font(
                        color: AppColorScheme.NEUTRAL_GREY_8_COLOR,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          if (controller!.listBrand.isEmpty) {
                            controller!.getBrands();
                          }
                          return DialogViewer(
                            car: car!,
                          );
                        },
                      );
                    },
                    child: const Text(
                      "Ver mais",
                      style: Helvetica300Font(
                        color: AppColorScheme.INFO_BLUE_6_COLOR,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(
                child: const Text(
                  'View',
                  style: Helvetica400Font(
                    color: AppColorScheme.NEUTRAL_GREY_8_COLOR,
                  ),
                ),
                onTap: () {
                  Future.delayed(
                    const Duration(seconds: 1),
                    () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return DialogViewer(
                            car: car!,
                          );
                        },
                      );
                    },
                  );
                },
              ),
              PopupMenuItem(
                child: const Text(
                  'Edit',
                  style: Helvetica400Font(
                    color: AppColorScheme.NEUTRAL_GREY_8_COLOR,
                  ),
                ),
                onTap: () {
                  Future.delayed(
                    const Duration(seconds: 1),
                    () async {
                      showDialog(
                        context: context,
                        builder: (context) {
                          controller!.setEditCar(car!);
                          return DialogForm(
                            controller: controller!,
                          );
                        },
                      );
                    },
                  );
                },
              ),
              PopupMenuItem(
                child: const Text(
                  'Delete',
                  style: Helvetica400Font(
                    color: AppColorScheme.NEUTRAL_GREY_8_COLOR,
                  ),
                ),
                onTap: () {
                  controller!.deleteCar(
                    "${car!.brand}_${car!.model}_${car!.yearModel.toString()}",
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
