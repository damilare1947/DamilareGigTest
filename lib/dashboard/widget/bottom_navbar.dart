import 'package:flutter/material.dart';

class BottomNavItem {
  final Widget page;

  /// If you prefer to use an SVG image as an icon, consider using `BottomNavIconWidget`.
  /// Otherwise, you can directly use the icon without any modifications.
  final Widget icon;
  final String iconLabel;

  BottomNavItem({required this.page, required this.icon, required this.iconLabel});
}

// class BottomNavIconWidget extends StatelessWidget {
//   const BottomNavIconWidget({
//     super.key,
//     this.isSelected = false,
//     required this.svgPath,
//   });
//   final bool isSelected;
//   final String svgPath;
//
//   @override
//   Widget build(BuildContext context) {
//     return SvgPicture.asset(
//       svgPath,
//       height: 24,
//       width: 24,
//       colorFilter: isSelected
//           ? const ColorFilter.mode(AppColors.sun_06, BlendMode.srcIn)
//           : const ColorFilter.mode(AppColors.oil_05, BlendMode.srcIn),
//     );
//   }
// }
