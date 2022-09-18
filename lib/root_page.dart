import 'package:duuchin_flutter/config/app_colors.dart';
import 'package:duuchin_flutter/view/root_pages/home_page.dart';
import 'package:duuchin_flutter/view/root_pages/music_page.dart';
import 'package:duuchin_flutter/view/root_pages/profile_page.dart';
import 'package:duuchin_flutter/view/root_pages/tiny_video_page.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

const Map bottomNames = {
  "home": "首页",
  "music": "音乐",
  "create_media": "",
  "tiny_video": "小视频",
  "profile": "我的"
};

class _RootPageState extends State<RootPage> {
  // 当前选中导航索引
  int _currentIndex = 0;
  // 页面集合
  final List<Widget>  _pages = [
    Homepage(),
    MusicPage(),
    Container(),
    ProfilePage(),
    TinyVideoPage()
  ];
  // 底部导航栏元素数组
  final List<BottomNavigationBarItem> _bottomNavBarList = [];

  @override
  void initState() {
    super.initState();
    // 初始化底部导航栏内容
    bottomNames.forEach((key, value) {
      _bottomNavBarList.add(_bottomNavigationBarItem(key, value));
    });
  }

  // 底部导航栏切换事件
  void _onTapClick(int index) {
    if (index == 2) {
      return _onCreateMedia();
    }
    setState(() {
      _currentIndex = index;
    });
  }

  // 点击发布按钮
  void _onCreateMedia() {
    print('_onCreateMedia');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavBarList,
        currentIndex: _currentIndex,
        onTap: _onTapClick,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButton: _createMediaButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // 底部导航栏发布按钮
  Widget _createMediaButton() {
    return Container(
      width: 44,
      height: 44,
      margin: EdgeInsets.only(top: 56),
      child: FloatingActionButton(
        backgroundColor: AppColors.nav,
        child: Image.asset(
            'assets/images/icons/create_media.png',
            width: 48,
            height: 48,
          ),
          onPressed: _onCreateMedia,
        ),
    );
  }

  // 底部导航栏组件
  BottomNavigationBarItem _bottomNavigationBarItem(String key, String title) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        'assets/images/icons/$key.png',
        width: 24,
        height: 24
      ),
      activeIcon: Image.asset(
        'assets/images/icons/${key}_active.png',
        width: 24,
        height: 24
      ),
      label: title,
      tooltip: ""
    );
  } 
}