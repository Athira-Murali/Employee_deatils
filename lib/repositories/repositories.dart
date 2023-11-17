import 'dart:convert';
import 'package:http/http.dart';

import '../model/user_list.dart';

class UserRepository {
  String endpoint = "https://api.slingacademy.com/v1/sample-data/users";

  Future<List<User>> getUser() async {
    try {
      Response response = await get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        print("get function");
        print(response.body);
        final dynamic result = jsonDecode(response.body)['data'];

        if (result != null && result is List) {
          return result.map((e) => User.fromJson(e)).toList();
        } else {
          throw Exception("Invalid data format in the response");
        }
      } else {
        throw Exception("Error: ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Error in API call: $e");
      throw e; // Re-throw the error so it can be caught in the Bloc
    }
  }
}


// class UserRepository {
//   String endpoint = "https://api.slingacademy.com/v1/sample-data/users";
//   Future<List<UserModel>> getUser() async {
//     try {
//       Response response = await get(Uri.parse(endpoint));
//       if (response.statusCode == 200) {
//         print("get function");
//         print(response.body);
//         final dynamic result = jsonDecode(response.body)['data'];

//         if (result != null && result is List) {
//           return result.map((e) => UserModel.fromJson(e)).toList();
//         } else {
//           throw Exception("Invalid data format in the response");
//         }
//       } else {
//         throw Exception(response.reasonPhrase);
//       }
//     } catch (e) {
//       print("Error in API call: $e");
//       throw e; // Re-throw the error so it can be caught in the Bloc
//     }
//   }

//   // Future<List<UserModel>> getUser() async {
//   //   Response response = await get(Uri.parse(endpoint));
//   //   if (response.statusCode == 200) {
//   //     print("get function");
//   //     print(response.body);
//   //     final List result = jsonDecode(response.body)['data'];
//   //     return result.map((e) => UserModel.fromJson(e)).toList();
//   //   } else {
//   //     throw Exception(response.reasonPhrase);
//   //   }
//   // }
// }
