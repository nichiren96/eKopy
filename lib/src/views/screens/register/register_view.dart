import 'package:ekopy/src/helpers/navigation_helper.dart';
import 'package:ekopy/src/helpers/view_helper.dart';
import 'package:ekopy/src/themes/buttons.dart';
import 'package:ekopy/src/themes/inputs.dart';
import 'package:ekopy/src/views/screens/forgotPassword/forgot_password_view.dart';
import 'package:ekopy/src/views/screens/login/login_view.dart';
import 'package:ekopy/src/views/screens/register/register_viewmodel.dart';
import 'package:ekopy/src/views/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (
        BuildContext context,
        RegisterViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 24, right: 16),
                child: Column(
                  children: [
                    const Text(
                      "Créer un compte",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    spacing(vertical: 8),
                    const Text(
                        "Lorem ipsum dolor sit arnet, consecteur adipiscing elit, sed do eiusmod tempor"),
                    spacing(vertical: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Input(
                            label: "Nom complet",
                            placeholder: "Jane Doe",
                            onChanged: (value) => model.setName(value)),
                        spacing(vertical: 8),
                        Input(
                            label: "Email",
                            placeholder: "janedoe@gmail.com",
                            onChanged: (value) => model.setEmail(value)),
                        spacing(vertical: 8),
                        Input(
                          label: "Mot de passe",
                          placeholder: "********",
                          isPassword: model.isObscure,
                          onChanged: (value) => model.setPassword(value),
                          togglePassword: () =>
                              model.togglePasswordVisibility(),
                        ),
                        spacing(vertical: 16),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text(
                            "Se souvenir de moi",
                            style: TextStyle(fontSize: 12),
                          ),
                          value: model.isChecked,
                          secondary: TextButton(
                              onPressed: () {
                                goto(context, const ForgotPasswordView());
                              },
                              child: const Text(
                                "Mot de passe oublié?",
                                style: TextStyle(fontSize: 12),
                              )),
                          onChanged: (bool? value) {
                            model.toggleRememberMe(value);
                          },
                        ),
                      ],
                    ),
                    spacing(vertical: 8),
                    SizedBox(
                        width: width(context) * 2 / 3,
                        height: 64,
                        child: Button.primary("CREER MON COMPTE", () {
                          model.setIsLoading(true);
                          model.register(context);
                        })),
                    spacing(vertical: 8),
                    model.isLoading ? Loader() : SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Vous avez déjà un compte?"),
                        TextButton(
                            onPressed: () {
                              goto(context, const LoginView());
                            },
                            child: const Text("Se connecter"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
