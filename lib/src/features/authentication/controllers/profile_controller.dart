import 'package:fit_lab/src/features/user_repository/user_repository.dart';
import 'package:fit_lab/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  // //controllers/update_profile
  // final email = TextEditingController();
  // final password = TextEditingController();
  // final fullName = TextEditingController();
  // final phoneNo = TextEditingController();
  // Repositories
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  // step-3 Get User Email and pass to userRepository to fetch user record
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("error", "Login to Continue");
    }
  }

  // user records profile
  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
