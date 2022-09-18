import 'package:duuchin_flutter/config/app_colors.dart';
import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  primaryColor: AppColors.primary, // 主题色
  scaffoldBackgroundColor: AppColors.page, // 页面背景色
  indicatorColor: AppColors.active, // 选项卡中所选选项卡指示器的颜色
  splashColor: Colors.transparent, // 取消水波纹效果
  highlightColor: Colors.transparent, // 取消水波纹效果
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      color: AppColors.unactive,
    )
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.nav,
    elevation: 0
  ),
  tabBarTheme: TabBarTheme(
    unselectedLabelColor: AppColors.unactive,
    indicatorSize: TabBarIndicatorSize.label,
    labelStyle: TextStyle(
      fontSize: 18
    ),
    labelPadding: EdgeInsets.symmetric(horizontal: 12 )
  ),
  // 底部按钮主题
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.nav,
    selectedItemColor: AppColors.active,
    unselectedItemColor: AppColors.unactive,
    selectedLabelStyle: TextStyle(
      fontSize: 12
    ),
  ),
);