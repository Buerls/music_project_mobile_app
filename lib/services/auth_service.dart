import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late Rx<User?> user;

  @override
  void onReady() {
    super.onReady();
    user = Rx<User?>(_auth.currentUser);
    user.bindStream(_auth.userChanges());

    ever(user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      Get.offAllNamed("/home");
    } else if (Get.currentRoute != "/login" &&
        Get.currentRoute != "/register") {
      Get.offAllNamed("/login");
    }
  }

  Future<UserCredential> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user.value = result.user;
      return Future.value(result);
    } catch (error) {
      return Future.error(error.toString());
    }
  }

  Future<UserCredential> signUp(String email, String password,
      String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password,);
      user.value = result.user;
      user.value!.updateDisplayName(name);

      return Future.value(result);
    } catch (error) {
      return Future.error(error.toString());
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    user.value = null;
  }


}