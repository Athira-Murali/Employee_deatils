import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';
import '../../model/user_list.dart';

class UserListController extends GetxController {
  var userList = User(
    success: false,
    message: '',
    totalUsers: 0,
    offset: 0,
    limit: 0,
    users: [],
  ).obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading(true);
      var response = await http
          .get(Uri.parse("https://api.slingacademy.com/v1/sample-data/users"));
      if (response.statusCode == 200) {
        var data = response.body;
        print(data);
        userList.value = User.fromJson(json.decode(data));
      }
    } finally {
      isLoading(false);
    }
  }

  Future<String> getLocationName(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        return '${place.locality}, ${place.administrativeArea}, ${place.country}';
      } else {
        return 'Unknown Location';
      }
    } catch (e) {
      return 'Error loading location';
    }
  }
}
