import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobicar_app/app/designsystem/styles/app_color_scheme.dart';
import 'package:mobicar_app/app/designsystem/styles/app_text_theme.dart';
import 'package:mobicar_app/app/designsystem/widgets/footer/footer.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
                "lib/app/designsystem/assets/images/drawer_background.png"),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                        "lib/app/designsystem/assets/images/logo.svg"),
                    InkWell(
                      onTap: () {
                        Modular.to.pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                            "lib/app/designsystem/assets/images/icon_drawer.svg"),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Homepage",
                        style: Helvetica700Font(
                          fontSize: 18.0,
                          color: AppColorScheme.INFO_BLUE_6_COLOR,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Column(
                        children: [2, 3, 4, 5, 6]
                            .map(
                              (e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "Menu item $e",
                                  style: const Helvetica700Font(
                                    fontSize: 18.0,
                                    color: AppColorScheme.NEUTRAL_GREY_2_COLOR,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      )
                    ],
                  ),
                ),
              )),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
