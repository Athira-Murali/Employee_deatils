import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_api/utils/theme/theme.dart';
import '../../model/user_list.dart';
import '../../widgets/custom_appbar.dart';
import '../user_details/user_details_screen.dart';
import 'user_list_controller.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserListController>(
        init: UserListController(),
        builder: (controller) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: CustomAppBar(
                onPress: () {
                  Get.back();
                },
                title: "User List",
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
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      child: Divider(
                        color: secondaryLightColor,
                        thickness: 1,
                      ),
                    ),
                    itemCount: controller.userList.value.users.length,
                    itemBuilder: (context, index) {
                      var user = controller.userList.value.users[index];
                      return UserListItem(user: user);
                    },
                  );
                }
              },
            ),
          );
        });
  }
}

class UserListItem extends StatelessWidget {
  final UserElement user;

  UserListItem({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.profilePicture),
        ),
        title: Text('${user.firstName} ${user.lastName}'),
        subtitle: Text('ID: ${user.id} | location : ${user.city}'),
        onTap: () {
          Get.to(UserDeatilsScreen(), arguments: user.id);
        },
      ),
    );
  }
}
