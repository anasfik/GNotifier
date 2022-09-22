import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:watch_it_later/view/get__started/get__started__page.dart';

import '../view/get__username__from__user/get__username__page.dart';
import '../view/main__page/main__page.dart';
import '../view/notification__full__page/notification__full__page.dart';

List<GetPage> getPages = [
  GetPage(
    name: '/getStarted',
    page: () => const GetStartedPage(),
  ),

  GetPage(
    name: '/getUsername',
    page: () => const GetUsernamePage(),
  ),
  GetPage(
    name: '/main',
    page: () => const MainPage(),
  ),
  GetPage(
    name: '/notificationFull',
    page: () => NotificationFullPage(),
  ),
];

class Paths {
  static const String getStartedPath = '/getStarted';
  static const String getUsernamePage = '/getUsername';
  static const String mainPath = '/main';
  static const String notificationFullPage = '/notificationFull';
}
