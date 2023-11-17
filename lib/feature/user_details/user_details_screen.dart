import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
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
                                horizontal: 5, vertical: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 0),
                                      child: SizedBox(
                                          height: 50,
                                          width: 70,
                                          child: Image.network(
                                              user.profilePicture)),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        Uri phoneno =
                                            Uri.parse('+919048241678');
                                        if (await launchUrl(phoneno)) {
                                          debugPrint("dialer opened");
                                        } else {
                                          debugPrint(" is not opened");
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 10, bottom: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Contact no',
                                                style: AppTheme.lightTheme
                                                    .textTheme.bodyLarge
                                                    ?.copyWith(
                                                        color: secondaryColor)),
                                            Text(user.phone,
                                                style: AppTheme.lightTheme
                                                    .textTheme.labelLarge
                                                    ?.copyWith(
                                                        color: primaryColor))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          '${user.firstName} ${user.lastName}'),
                                      Text(user.job),
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          user.email,
                                          style: AppTheme
                                              .lightTheme.textTheme.labelLarge
                                              ?.copyWith(color: secondaryColor),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
