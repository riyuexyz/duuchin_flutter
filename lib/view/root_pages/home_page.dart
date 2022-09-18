import 'package:duuchin_flutter/components/root_page_head.dart';
import 'package:duuchin_flutter/http/http.dart';
import 'package:duuchin_flutter/view/sub_pages/song_page.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

const List<Tab> _tabs  = [
  Tab(text: "歌曲",),
  Tab(text: "推荐",),
  Tab(text: "歌手",),
  Tab(text: "小视频",),
  Tab(text: "文章",),
  Tab(text: "视频",),
];

final List<Widget> _tabsContent = [
  SongPage(),
  Text("1111"),
  Text("1111"),
  Text("1111"),
  Text("1111"),
  Text("1111"),
];

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {

  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      initialIndex: 1,
      length:  _tabs.length, 
      vsync: this,
    );

    // 监听切换
    _tabController.addListener(() async { 

    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RootPageHead(),
        bottom: TabBar(
          tabs: _tabs,
          controller: _tabController,
          // isScrollable: true,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabsContent,
      ),
    );
  }
}