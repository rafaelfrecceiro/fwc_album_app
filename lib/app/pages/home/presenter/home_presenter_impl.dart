import 'package:fwc_album_app/app/pages/home/presenter/home_presenter.dart';
import 'package:fwc_album_app/app/pages/home/view/home_view.dart';
import 'package:fwc_album_app/app/repositories/user/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePresenterImpl implements HomePresenter {
  late HomeView _view;
  final UserRepository userRepository;

  HomePresenterImpl({
    required this.userRepository,
  });

  @override
  set view(HomeView view) => _view = view;

  @override
  Future<void> getUserData() async {
    _view.showLoader();
    try {
      final user = await userRepository.getMe();
      _view.updateUser(user);
    } catch (e) {
      _view.error('Erro ao buscar dados do usuário');
    }
  }

  @override
  Future<void> logout() async {
    _view.showLoader();
    final sp = await SharedPreferences.getInstance();
    sp.clear();
    _view.logoutSuccess();
  }
}
