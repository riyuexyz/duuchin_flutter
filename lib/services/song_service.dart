import 'package:duuchin_flutter/http/http.dart';

// 歌曲数据
class SongService {

  static const String rootPath = '/api/song';
  static const String listPath = '$rootPath/list';
  static const String infoPath = '$rootPath/info';

  // 列表数据
  static Future getSongs({ int page = 1, int limit = 10 }) async {
    final response = await Http.post(
      listPath, 
      data: { 'page': page, 'limit': limit },
    );
    Map<String, dynamic> result = response['page'];
    return result;
  }
}