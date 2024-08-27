import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/dashboard/widget/app_bottom_nav_bar.dart';
import 'package:untitled/dashboard/widget/bottom_navbar.dart';
import 'package:untitled/team/pages/team.dart';

class Dashboard extends StatefulWidget {
  static String path = '/Dashboard';

  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;

  // ThemeController ctr = Get.find();
  late PageController controller;
  Duration animDuration = const Duration(milliseconds: 200);

  setInitialIndex() {
    currentIndex = 0;

    setState(() {});
  }

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    setInitialIndex();
    //setThemeMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavItem> pageParams = [
      BottomNavItem(
          page: Container(),
          icon: Obx(() => Icon(
                Icons.home,
                color: getSelectedItemColor(0).value,
              )),
          iconLabel: 'Home'),
      BottomNavItem(
          page: Container(),
          icon: Obx(() => Icon(
                Icons.check_circle_outline_outlined,
                color: getSelectedItemColor(1).value,
              )),
          iconLabel: 'Tasks'),
      BottomNavItem(
          page: Team(),
          icon: Obx(() => Icon(
                Icons.people,
                color: getSelectedItemColor(2).value,
              )),
          iconLabel: 'Team'),
      BottomNavItem(
          page: Container(),
          icon: Obx(() => Icon(
                Icons.settings,
                color: getSelectedItemColor(3).value,
              )),
          iconLabel: 'Settings'),
      BottomNavItem(
          page: Container(),
          icon: Obx(() => Icon(
                Icons.help,
                color: getSelectedItemColor(4).value,
              )),
          iconLabel: 'Help'),
    ];
    return Scaffold(
      bottomNavigationBar: PopScope(
        canPop: false,
        onPopInvoked: (val) {
          //handleBackPress();
        },
        child: AppBottomNavBar(
          currentIndex: currentIndex,
          itemParams: pageParams,
          onchanged: (value) {
            controller.animateToPage(value, duration: animDuration, curve: Curves.easeIn);
            setState(() {
              currentIndex = value;
            });
          },
        ),
      ),
      body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (val) {
            setState(() {
              currentIndex = val;
            });
          },
          controller: controller,
          itemCount: pageParams.length,
          itemBuilder: ((context, index) => pageParams[index].page)),
    );
  }

  Rx<Color?> getSelectedItemColor(int index) {
    return (currentIndex == index ? (Colors.blue) : null).obs;
  }
}
