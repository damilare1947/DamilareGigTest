import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    required this.hint,
    super.key,
  });

  final String hint;

  @override
  Widget build(BuildContext context) {
    //LifeStyleController ctrl = Get.find<LifeStyleController>();
    return TextFormField(
      onChanged: (val) {
        // if (hint.toLowerCase().contains("address")) {
        //   ctrl.placesAutoComplete(val);
        // } else {
        //   ctrl.filterCategories(val);
        // }
      },
      decoration: InputDecoration(
        fillColor: Colors.grey.withOpacity(0.2),
        filled: true,
        contentPadding: EdgeInsets.zero,
        prefixIcon: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.search),
        ),
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.1)),
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.1)),
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.1)),
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
      ),
    );
  }
}
