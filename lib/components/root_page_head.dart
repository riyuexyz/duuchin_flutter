import 'package:duuchin_flutter/config/app_colors.dart';
import 'package:flutter/material.dart';

class RootPageHead extends StatelessWidget {
  const RootPageHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/common/logo.png',
          height: 40,
        ),
        Expanded(
          child: _searchContent(),
        ),
        Image.asset(
          'assets/images/icons/msg.png',
          height: 30,
        )
      ],
    );
  }
  
  Widget _searchContent() {
    return Container(
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.page,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6, right: 2),
            child: Icon(
              Icons.search, 
              size: 16,
              color: AppColors.un3active
            ),
          ),
          Text(
            '搜索关键词',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.un3active
            ),
          )
        ],
      ),
    );
  }

}