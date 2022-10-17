import 'package:fwc_album_app/app/models/group_stickers_model.dart';

abstract class MyStickersView {
  void loadedPage(List<GroupStickersModel> album);
  void error(String message);
  void updateStatusFilter(status);
  void updateAlbum(List<GroupStickersModel> album);
}
