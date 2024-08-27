import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamDetails extends StatelessWidget {
  static String path = '/TeamDetails';

  TeamDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var userDetails = Get.arguments['userDetails'];
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: Image.asset('data/assets/img2.png'),
            ),
            Text(
              'Welcome !',
              style: TextStyle(fontSize: 20.h),
            ),
            Text(
              userDetails!.name,
              style: TextStyle(fontSize: 20.h),
            )
          ],
        ),
      ),
    );
  }
}
