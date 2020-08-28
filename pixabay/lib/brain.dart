import 'package:image_downloader/image_downloader.dart';
import 'package:pixabay/models/Hit.dart';
import 'package:pixabay/services/network.dart';

class Brain {
  Network n = new Network();

  String _imagePath = '';

  List<Hit> _list = [];

  //getters
  List getList() => _list;

  String getImagePath() => _imagePath;

  int getId(int i) => _list[i].getId();

  String getPreviewUrl(int i) => _list[i].getPreviewURL();

  int getLength() => _list.length;

  //setters
  Future<void> downloadImage(String url) async {
    dynamic image = await n.downloadImage(url: url);
    _imagePath = await ImageDownloader.findPath(image);
  }

  Future<void> newList(context) async {
    List<Hit> list = await n.getList();
    _list.clear();
    _list.addAll(list);
  }
}
