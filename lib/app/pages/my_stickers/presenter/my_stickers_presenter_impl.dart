import 'package:fwc_album_app/app/models/group_stickers_model.dart';
import 'package:fwc_album_app/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:fwc_album_app/app/pages/my_stickers/view/my_stickers_view.dart';
import 'package:fwc_album_app/app/repositories/stickers/stickers_repository.dart';

class MyStickersPresenterImpl implements MyStickersPresenter {
  late final MyStickersView _view;
  final StickersRepository stickersRepository;

  var album = <GroupStickersModel>[];
  var statusSelected = 'all';

  List<String>? countries;

  MyStickersPresenterImpl({
    required this.stickersRepository,
  });

  @override
  set view(MyStickersView view) => _view = view;

  @override
  Future<void> getMyAlbum() async {
    album = await stickersRepository.getMyAlbum();
    _view.loadedPage([...album]);
  }

  @override
  Future<void> statusFilter(String status) async {
    statusSelected = status;
    _view.updateStatusFilter(status);
  }

  @override
  void countryFilter(List<String>? countries) {
    this.countries = countries;
    if (countries == null) {
      _view.updateAlbum(album);
    } else {
      final albumFiltered = [
        ...album.where((element) => countries.contains(element.countryCode))
      ];
      _view.updateAlbum(albumFiltered);
    }
  }
}
