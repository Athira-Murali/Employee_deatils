import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_api/feature/user_details/user_deatils_controller.dart';
import 'package:user_api/utils/theme/theme.dart';

import '../../widgets/custom_appbar.dart';

class UserDeatilsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDetailsController>(
        init: UserDetailsController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: CustomAppBar(
                onPress: () {
                  Get.back();
                },
                title: "User Details",
              ),
            ),
            body: Obx(
              () {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 5,
                    ),
                    itemCount: controller.userList.value.users.length,
                    itemBuilder: (context, index) {
                      var user = controller.userList.value.users[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: secondaryLightColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${user.firstName} ${user.lastName}'),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 10),
                                      child: SizedBox(
                                          height: 50,
                                          width: 70,
                                          child: Image.network(
                                              user.profilePicture)),
                                    )
                                  ],
                                ),
                                Text(user.job)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          );
        });
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../model/user_list.dart';
// import 'user_deatils_controller.dart';

// class UserDetailsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<UserDetailsController>(
//         init: UserDetailsController(),
//         builder: (controller) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('User Details'),
//             ),
//             body: Obx(
//               () {
//                 if (controller.isLoading.value) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else {
//                   return UserDetailsWidget(
//                       user: controller.userList.value.users.first);
//                 }
//               },
//             ),
//           );
//         });
//   }
// }

// class UserDetailsWidget extends StatelessWidget {
//   final UserElement user;

//   UserDetailsWidget({required this.user});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CircleAvatar(
//           backgroundImage: NetworkImage(user.profilePicture),
//           radius: 50,
//         ),
//         SizedBox(height: 20),
//         Text('ID: ${user.id}',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         Text('Name: ${user.firstName} ${user.lastName}',
//             style: TextStyle(fontSize: 18)),
//         Text('Email: ${user.email}', style: TextStyle(fontSize: 18)),
//         // Add more details as needed
//       ],
//     );
//   }
// }
