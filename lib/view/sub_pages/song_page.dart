import 'package:duuchin_flutter/models/song_model.dart';
import 'package:duuchin_flutter/services/song_service.dart';
import 'package:flutter/material.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {

  List<SongItem> _songList = SongList([]).list;
  int page = 1;
  int limit = 10;
  bool hasMore = false;
  bool error = false;
  String errMsg = '';

  @override
  void initState() {
    super.initState();

    _getSongs();
  }

  Future _getSongs({ bool push = false }) async {
    try {
      // 获取数据
      Map<String, dynamic> result = await SongService.getSongs(page: page, limit: limit);
      // 转换为实体类
      SongList songListModel = SongList.fromJson(result['data']);

      setState(() {
        hasMore = page * limit < result['total'];
        page++;

        if (push) {
          _songList.addAll(songListModel.list);
        } else {
          _songList = songListModel.list;
        }
      });
    } catch (e) {
      errMsg = e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _songList.length,
      itemBuilder: (context, index) {
        return Container(
          height: 80,
          color: Colors.black.withOpacity(index / 10),
        );
      }
    );
  }
}