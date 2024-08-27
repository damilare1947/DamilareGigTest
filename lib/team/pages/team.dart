import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/navigation_service.dart';
import 'package:untitled/team/controller/team_controller.dart';
import 'package:untitled/team/pages/team_details.dart';
import 'package:untitled/team/widget/search.dart';

class Team extends StatelessWidget {
  Team({super.key});

  final TeamController ctrl = Get.put(TeamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Obx(
        () => ctrl.floatText.value != ""
            ? SizedBox(
                width: 100.w,
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Text(ctrl.floatText.value),
                ),
              )
            : const SizedBox(),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              titleBar(),
              SizedBox(
                height: 30.h,
              ),
              const SearchWidget(hint: 'Search for messages or users'),
              SizedBox(
                height: 30.h,
              ),
              Obx(
                () => Expanded(
                  child: ListView.separated(
                      itemBuilder: (ctx, i) {
                        return ListTile(
                          leading: Image.asset('data/assets/img2.png'),
                          title: Text(ctrl.user[i].name),
                          subtitle: Text(ctrl.user[i].username),
                          onTap: () {
                            ctrl.setFloatingObject(ctrl.user[i].company.catchPhrase);
                            NavigationService().push(page: TeamDetails.path, arguments: {'userDetails': ctrl.user[i]});
                          },
                        );
                      },
                      separatorBuilder: (ctx, i) => Divider(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                      itemCount: ctrl.user.length),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleBar() {
    return Row(
      children: [
        Text(
          'Team',
          style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.4),
            borderRadius: BorderRadius.circular(3.r),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.people,
                color: Colors.white,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                ctrl.user.length.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        CircleAvatar(
          radius: 17.r,
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
