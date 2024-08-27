import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({super.key, required bool isSelected, required int length, required this.indicatorColor})
      : _isSelected = isSelected,
        _length = length;

  final bool _isSelected;
  final int _length;
  final Color indicatorColor;

  // Color getSelectedItemColor() {
  //   return Get.isDarkMode ? AppColors.sky_03 : AppColors.sky_10;
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: _length == 3
                ? 22.33
                : _length == 5
                    ? 21.40
                    : 35.75,
            // width: 21.40,
            height: 4,
            decoration: ShapeDecoration(
              color: _isSelected ? indicatorColor : null,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
