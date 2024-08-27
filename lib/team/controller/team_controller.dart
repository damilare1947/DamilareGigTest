import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled/team/model/user_model.dart';

class TeamController extends GetxController {
  RxList<User> user = <User>[].obs;

  @override
  void onInit() {
    getUsers("");
    super.onInit();
  }

  RxString floatText = "".obs;

  setFloatingObject(item) {
    floatText.value = item;
  }

  void getUsers(String keyword) async {
    final String response = await rootBundle.loadString("data/assets/users.json");
    final data = await json.decode(response);
    user.value = List<User>.from(data.map(
      (model) => User.fromJson(model),
    ));
    print("the value is $user");
  }
}
