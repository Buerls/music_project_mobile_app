import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:music_project/services/auth_service.dart';

import '../constants.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final AuthService _authController = Get.find();
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: BACKGROUND_COLOR,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 20,
                        child: Column(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: const Text(
                                'Hoş Geldin,',
                                style: TextStyle(
                                    fontSize: 32.0,
                                    color: WHITE,
                                    fontWeight: FontWeight.w100,
                                    letterSpacing: 2.0),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                '${_authController.user!.value?.displayName?.split(" ")[0]}',
                                style: const TextStyle(
                                    fontSize: 32.0,
                                    color: WHITE,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: InkWell(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                          onTap: _homeController.profileAvatarClicked,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(_authController
                                        .user.value?.photoURL ??
                                    'https://cdn.discordapp.com/avatars/147752955066449920/f7a0f37a495f5e8d6ce4e3c162a531a5.webp?size=128'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(100)),
                              border: Border.all(
                                color: LIGHT_GREEN,
                                width: 3.0,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    color: BACKGROUND_COLOR_LIGHT,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.wifi_rounded,
                            size: 300,
                            color: Color(0xffa1a1a1),
                          ),
                          Text(
                            'Yerel ağında arama yapmamız için bağlan butonuna tıklaman yeterli !  ',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: GRAY,
                                letterSpacing: 1.0),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                        letterSpacing: 1.0,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                    backgroundColor: LIGHT_GREEN,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(150, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  onPressed: () => _homeController.discoverAPI(),
                  child: const Text('Bağlan'),
                ),
              ],
            ),
          ),
        ),
        Obx(
          () => _homeController.isLoading.value
              ? Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: LIGHT_GREEN,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
