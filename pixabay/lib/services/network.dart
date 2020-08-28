import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:pixabay/models/Hit.dart';
import 'package:image_downloader/image_downloader.dart';

class Network {
  Future<List<Hit>> getList() async {
    var url =
        'https://pixabay.com/api/?key=18067643-66520af2153cb9e7f0a57d921&q=yellow+flowers&image_type=photo';

    dynamic response = await http.get(url);
    var jsonResponse = convert.jsonDecode(response.body)['hits'] as List;
    return jsonResponse.map((item) => Hit.fromJson(item)).toList();
  }

  Future<dynamic> downloadImage({String url}) async {
    return await ImageDownloader.downloadImage(url);
  }
}
