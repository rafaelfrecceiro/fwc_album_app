import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/auth/login/presenter/login_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/login/view/login_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;
  const LoginPage({super.key, required this.presenter});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginViewImpl {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: context.colors.primary,
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(slivers: [
            SliverList(
              delegate: SliverChildListDelegate.fixed([
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      (MediaQuery.of(context).size.width > 400 ? 0.30 : 0.25),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: Text(
                      'Login',
                      style: context.textStyles.titleWhite,
                    ),
                  ),
                ),
                TextFormField(
                  controller: emailEC,
                  validator: Validatorless.multiple([
                    Validatorless.required('Informe um E-mail'),
                    Validatorless.email('E-mail inválido')
                  ]),
                  decoration: const InputDecoration(
                    label: Text('E-mail'),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordEC,
                  validator: Validatorless.required('Informe uma senha'),
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text('Senha'),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(
                    'Esqueceu a senha?',
                    style: context.textStyles.textSecondaryFontMedium.copyWith(
                      color: context.colors.yellow,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Button(
                    width: MediaQuery.of(context).size.width * 0.90,
                    onPressed: () {
                      final isValid = formKey.currentState?.validate() ?? false;

                      if (isValid) {
                        showLoader();
                        widget.presenter.login(emailEC.text, passwordEC.text);
                      }
                    },
                    style: context.buttonStyles.yellowButton,
                    labelStyle: context
                        .textStyles.textSecondaryFontBoldPrimaryColor
                        .copyWith(fontWeight: FontWeight.w800),
                    label: 'Entrar')
              ]),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Text.rich(
                    style: context.textStyles.textSecondaryFontMedium
                        .copyWith(color: Colors.white),
                    TextSpan(text: 'Não possui uma conta? ', children: [
                      TextSpan(
                        text: 'Cadastra-se',
                        style: context.textStyles.textSecondaryFontMedium
                            .copyWith(color: context.colors.yellow),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              Navigator.of(context).pushNamed('/auth/register'),
                      ),
                    ]),
                  ),
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
