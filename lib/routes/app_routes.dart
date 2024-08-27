import 'package:get/get.dart';
import 'package:untitled/dashboard/dashboard.dart';
import 'package:untitled/team/pages/team_details.dart';

class AppPages {
  static List<GetPage> appPages = [
    GetPage(name: Dashboard.path, page: () => const Dashboard()),
    GetPage(name: TeamDetails.path, page: () => TeamDetails()),
  ];
}
