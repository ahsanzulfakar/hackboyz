import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      //color: Colors.white,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 5,
          color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text("Hack Boys", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp)),
          ),
          Padding(
            padding: EdgeInsets.only(right: 30.w),
            child: Row(
              children: <Widget>[
                TextButton(
                  child: Text("Home", style: TextStyle(fontSize: 20.sp, color: Colors.black),),
                  onPressed: (){
                    Navigator.pushNamed(context, '/homepage');
                  },
                ),
                SizedBox(width: 30.w),
                TextButton(
                  child: Text("Training", style: TextStyle(fontSize: 20.sp, color: Colors.black),),
                  onPressed: (){
                    Navigator.pushNamed(context, '/maintraining');
                  },
                ),
                SizedBox(width: 30.w),
                TextButton(
                  child: Text("Handover", style: TextStyle(fontSize: 20.sp, color: Colors.black),),
                  onPressed: (){
                    Navigator.pushNamed(context, '/mainhandover');
                  },
                ),
                SizedBox(width: 30.w),
                const Icon(
                  Icons.account_circle_outlined,
                  size: 40,
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}