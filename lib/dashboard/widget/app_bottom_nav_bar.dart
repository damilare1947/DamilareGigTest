import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled/dashboard/widget/bottom_navbar.dart';
import 'package:untitled/dashboard/widget/indicator.dart';

class AppBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int>? onchanged;
  final List<BottomNavItem> itemParams;

  const AppBottomNavBar({super.key, this.currentIndex = 0, this.onchanged, required this.itemParams});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  int _currentIndex = 0;

  // ThemeController ctr = Get.find();

  @override
  void initState() {
    _currentIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color getUnSelectedItemColor() {
      return Colors.black;
    }

    Color getBoarderSideColors() {
      return Colors.black;
    }

    // Color getBackgroundColor() {
    //   return Get.isDarkMode ? AppColors.darkContainer : Colors.white;
    // }

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        height: Platform.isIOS ? 97 : 67,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: getBoarderSideColors(),
          borderRadius: widget.itemParams.length == 4
              ? null
              : const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
          border: widget.itemParams.length == 4
              ? Border(
                  left: BorderSide(color: getBoarderSideColors(), width: 0),
                  top: BorderSide(
                    width: 1,
                    color: getBoarderSideColors(),
                  ),
                  right: BorderSide(color: getBoarderSideColors(), width: 0),
                  bottom: BorderSide(color: getBoarderSideColors(), width: 0),
                )
              : null,
          boxShadow: const [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 4,
              offset: Offset(0, -1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Container(
          height: Platform.isIOS ? 93 : 64,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 2,
                ),
                StatefulBuilder(
                    builder: (t, t4) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                            widget.itemParams.length,
                            (index) =>
                                IndicatorWidget(isSelected: _currentIndex == index, length: widget.itemParams.length, indicatorColor: Colors.black),
                          ),
                        )),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: BottomNavigationBar(
                      currentIndex: _currentIndex,
                      onTap: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                        if (widget.onchanged != null) {
                          widget.onchanged!(index);
                        }
                      },
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.blue,
                      unselectedItemColor: getUnSelectedItemColor(),
                      showSelectedLabels: true,
                      iconSize: 24,
                      selectedLabelStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: widget.itemParams.length > 3 ? 'Gotham' : 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: widget.itemParams.length > 3 ? 'Gotham' : 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                      unselectedFontSize: 12,
                      selectedFontSize: 12,
                      backgroundColor: Colors.white,
                      showUnselectedLabels: true,
                      items: List.generate(
                        widget.itemParams.length,
                        (index) => BottomNavigationBarItem(
                          icon: widget.itemParams[index]
                              .icon, // if using default icons, there is no need to change the state of it, it would change authomatically
                          label: widget.itemParams[index].iconLabel,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
