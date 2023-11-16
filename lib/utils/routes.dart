import 'package:get/get.dart';

import '../feature/user_list/user_list.dart';

List<GetPage> routes() => [
      GetPage(
          name: "/",
          page: () => UserListScreen(),
          transition: Transition.cupertino),
    ];
