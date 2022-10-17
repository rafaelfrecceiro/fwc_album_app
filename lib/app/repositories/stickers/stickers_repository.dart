import 'package:fwc_album_app/app/models/group_stickers_model.dart';

abstract class StickersRepository {
  Future<List<GroupStickersModel>> getMyAlbum();
}
