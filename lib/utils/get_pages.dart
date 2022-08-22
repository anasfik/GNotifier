import 'package:get/get_navigation/src/routes/get_route.dart';

import '../view/get__username__from__user/get__username__page.dart';
import '../view/main__page/main__page.dart';
import '../view/notification__full__page/notification__full__page.dart';

List<GetPage> getPages = [
  GetPage(name: '/getUsernamePage', page: () => const GetUsernamePage()),
  GetPage(name: ('/mainPage'), page: () => const MainPage()),
  GetPage(name: '/notificationFullPage', page: () => NotificationFullPage()),
];
