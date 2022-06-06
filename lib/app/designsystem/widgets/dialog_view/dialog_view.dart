import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobicar_app/app/designsystem/styles/app_color_scheme.dart';
import 'package:mobicar_app/app/designsystem/styles/app_text_theme.dart';
import 'package:mobicar_app/app/designsystem/widgets/button/mobicar_button.dart';
import 'package:mobicar_app/app/designsystem/widgets/button/variant_button.dart';
import 'package:mobicar_app/app/modules/domain/entities/car_entity.dart';

class DialogViewer extends StatelessWidget {
  const DialogViewer({
    Key? key,
    required this.car,
  }) : super(key: key);

  final CarEntity car;

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
            child: Row(
              children: [1, 2, 3, 4, 5]
                  .map((e) => Icon(
                        Icons.star_rounded,
                        size: 22.0,
                        color: car.assessment! >= e
                            ? AppColorScheme.WARNING_YELLOW_6_COLOR
                            : AppColorScheme.NEUTRAL_GREY_2_COLOR,
                      ))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(car.brand!),
                      const SizedBox(height: 16.0),
                      Text(car.model!),
                    ],
                  ),
                ),
                const SizedBox(width: 24.0),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(car.yearModel!.toString()),
                      const SizedBox(height: 16.0),
                      Text(car.value!),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: MobicarButton(
            text: "Reservar",
            onPressed: () => Modular.to.pop(),
            variant: ButtonVariant.primary,
          ),
        ),
      ],
    );
  }
}
