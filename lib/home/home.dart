// import 'package:flutter/material.dart';
//
// import 'dart:io';
//
// import 'package:flutter/material.dart';
//
// class Dashboard
//     extends StatefulWidget {
//   const ShopOnLit({
//     super.key,
//   });
//
//
//
//   @override
//   State<ShopOnLit> createState() => _ShopOnLitState();
// }
//
// class _ShopOnLitState extends State<ShopOnLit> {
//   int currentIndex = 0;
//   ThemeController ctr = Get.find();
//   late PageController controller;
//   Duration animDuration = const Duration(milliseconds: 200);
//
//   handleBackPress() {
//     if (currentIndex != 0) {
//       controller.previousPage(duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
//     } else {
//       showInfoAlertDialog(
//         context,
//         message: 'Are you sure you want to exit the app?',
//         label: 'Yes',
//         secondLabel: 'No',
//         secondButton: true,
//         barrierDismissible: false,
//         action: () {
//           exit(0);
//         },
//         secondAction: () {
//           Get.back();
//         },
//       );
//     }
//   }
//
//   setInitialIndex() {
//     currentIndex = 0;
//
//     setState(() {});
//   }
//
//   @override
//   void initState() {
//     controller = PageController(initialPage: 0);
//     setInitialIndex();
//     //setThemeMode();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<BottomNavItem> pageParams = [
//       BottomNavItem(
//           page: LifeStyleScreen(
//             fromOutsideApp: true,
//           ),
//           icon: Obx(() => SvgPicture.asset(AppAssets.lifeStyleIcon, color: getSelectedItemColor(1).value)),
//           iconLabel: 'Lifestyle'),
//       BottomNavItem(
//           page: const Stores(), icon: Obx(() => SvgPicture.asset(AppAssets.storesIcon, color: getSelectedItemColor(2).value)), iconLabel: 'Stores'),
//       BottomNavItem(
//           page: GenericPayBills2(
//             fromOutsideApp: true,
//           ),
//           icon: Obx(() => SvgPicture.asset(AppAssets.profileIcon, color: getSelectedItemColor(3).value)),
//           iconLabel: 'Bills'),
//     ];
//     return Scaffold(
//       bottomNavigationBar: PopScope(
//         canPop: false,
//         onPopInvoked: (val) {
//           handleBackPress();
//         },
//         child: AppBottomNavBar(
//           currentIndex: currentIndex,
//           itemParams: pageParams,
//           onchanged: (value) {
//             controller.animateToPage(value, duration: animDuration, curve: Curves.easeIn);
//             setState(() {
//               currentIndex = value;
//             });
//           },
//         ),
//       ),
//       body: PageView.builder(
//           physics: const NeverScrollableScrollPhysics(),
//           onPageChanged: (val) {
//             setState(() {
//               currentIndex = val;
//             });
//           },
//           controller: controller,
//           itemCount: pageParams.length,
//           itemBuilder: ((context, index) => pageParams[index].page)),
//     );
//   }
//
//   Rx<Color?> getSelectedItemColor(int index) {
//     return (currentIndex == index ? (ctr.isDarkTheme(context).value ? AppColors.sky_03 : AppColors.sky_10) : null).obs;
//   }
// }
