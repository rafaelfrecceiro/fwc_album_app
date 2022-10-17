import 'package:flutter/cupertino.dart';
import 'package:fwc_album_app/app/core/ui/global/global_context.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/repositories/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class GlobalContextImpl implements GlobalContext {
  final GlobalKey<NavigatorState> navigatorKey;
  final AuthRepository authRepository;

  GlobalContextImpl({required this.navigatorKey, required this.authRepository});

  @override
  Future<void> loginExpire() async {
    final sp = await SharedPreferences.getInstance();
    sp.clear();
    showTopSnackBar(
        navigatorKey.currentState!.context,
        CustomSnackBar.error(
          message: 'Login expirado',
          backgroundColor: ColorsApp.i.primary,
        ),
        overlayState: navigatorKey.currentState!.overlay);

    navigatorKey.currentState!
        .pushNamedAndRemoveUntil('/login', (route) => false);
  }
}
