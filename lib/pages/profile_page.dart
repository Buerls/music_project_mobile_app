// Profile page with getx

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_project/services/auth_service.dart';

import '../constants.dart';
import '../controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final AuthService _authController = Get.find();
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BACKGROUND_COLOR,
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 32, left: 16),
          child: FloatingActionButton(
            onPressed: () {
              _profileController.backIconPressed();
            },
            child: const Icon(Icons.arrow_back),
            backgroundColor: BACKGROUND_COLOR,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  shadowColor: LIGHT_GREEN,
                  color: LIGHT_GREEN,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                      ),
                      Container(
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
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _authController.user.value?.displayName ?? 'User',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: BACKGROUND_COLOR,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "369",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "İstek Parça",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "26",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Farklı Konum",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w200),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  color: BACKGROUND_COLOR_LIGHT,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Son Etkinlikler",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              color: WHITE,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      //Scrollable view for the list of places user went
                      Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: Icon(Icons.location_on),
                                title: Text(
                                  "Konum",
                                ),
                                subtitle: Text("Tarih"),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
