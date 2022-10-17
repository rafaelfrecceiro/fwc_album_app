import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/pages/auth/register/register_page.dart';
import 'package:fwc_album_app/app/pages/auth/register/view/register_view.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';

class RegisterViewImpl extends State<RegisterPage>
    with Loader<RegisterPage>, Messages<RegisterPage>
    implements RegisterView {
  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void registerError([String? message]) {
    hideLoader();
    showError(message ?? 'Erro ao registrar usuário');
  }

  @override
  void registerSuccess() {
    hideLoader();
    showSuccess('Usuário cadastrado com sucesso');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
