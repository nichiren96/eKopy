import 'package:ekopy/src/helpers/navigation_helper.dart';
import 'package:ekopy/src/helpers/view_helper.dart';
import 'package:ekopy/src/themes/buttons.dart';
import 'package:ekopy/src/themes/inputs.dart';
import 'package:ekopy/src/views/screens/forgotPassword/forgot_password_view.dart';
import 'package:ekopy/src/views/screens/login/login_viewmodel.dart';
import 'package:ekopy/src/views/screens/register/register_view.dart';
import 'package:ekopy/src/views/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (
        BuildContext context,
        LoginViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, top: 24, right: 16),
                child: Column(
                  children: [
                    Text(
                      "Bienvenue",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    spacing(vertical: 8),
                    Text(
                        "Lorem ipsum dolor sit arnet, consecteur adipiscing elit, sed do eiusmod tempor"),
                    spacing(vertical: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Input(
                          label: "Email",
                          placeholder: "janedoe@gmail.com",
                          onChanged: (value) => model.setEmail(value),
                        ),
                        spacing(vertical: 8),
                        Input(
                          label: "Password",
                          placeholder: "********",
                          isPassword: model.isObscure,
                          onChanged: (value) => model.setPassword(value),
                          togglePassword: () =>
                              model.togglePasswordVisibility(),
                        ),
                        spacing(vertical: 16),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(
                            "Se souvenir de moi",
                            style: TextStyle(fontSize: 12),
                          ),
                          value: model.isChecked,
                          secondary: TextButton(
                              onPressed: () {
                                goto(context, ForgotPasswordView());
                              },
                              child: Text(
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
                        child: Button.primary("SE CONNECTER", () {
                          model.setIsLoading(true);
                          model.login(context);
                        })),
                    spacing(vertical: 8),
                    model.isLoading ? Loader() : SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Vous n'avez pas de compte?"),
                        TextButton(
                            onPressed: () {
                              goto(context, RegisterView());
                            },
                            child: Text("Créer un compte"))
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
