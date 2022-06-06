import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobicar_app/app/designsystem/styles/app_color_scheme.dart';
import 'package:mobicar_app/app/designsystem/widgets/button/mobicar_button.dart';
import 'package:mobicar_app/app/designsystem/widgets/button/variant_button.dart';
import 'package:mobicar_app/app/designsystem/widgets/card_car/card_card.dart';
import 'package:mobicar_app/app/designsystem/widgets/dialog_form/dialog_form.dart';
import 'package:mobicar_app/app/designsystem/widgets/footer/footer.dart';
import 'package:mobicar_app/app/modules/domain/entities/car_entity.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    controller.getSaveCarSelectedList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: width * 18,
        leading: Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: SvgPicture.asset(
                "lib/app/designsystem/assets/images/logo.svg")),
        actions: [
          InkWell(
            onTap: () {
              Modular.to.pushNamed(
                "/drawer",
              );
            },
            child: Container(
              padding: const EdgeInsets.only(right: 20.0),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                "lib/app/designsystem/assets/images/icon_drawer.svg",
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.only(top: 36.0, bottom: 8.0),
              width: double.infinity,
              alignment: Alignment.centerRight,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 1, color: AppColorScheme.NEUTRAL_GREY_10_COLOR),
                ),
              ),
              child: MobicarButton(
                text: "Add new",
                variant: ButtonVariant.primary,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      controller.getBrands();
                      return DialogForm(
                        controller: controller,
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Observer(
                builder: (_) {
                  return ListView.builder(
                    itemCount: controller.listCarSelected.length,
                    itemBuilder: (_, index) {
                      List<CarEntity> listCar = controller.listCarSelected;
                      return CardCar(
                        car: listCar[index],
                        controller: controller,
                      );
                    },
                  );
                },
              ),
            ),
          ),
          const Footer()
        ],
      ),
    );
  }
}
