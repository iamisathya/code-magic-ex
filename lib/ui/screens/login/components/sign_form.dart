import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:code_magic_ex/ui/global/router.dart';
import 'package:code_magic_ex/ui/screens/login/bloc.dart';
import 'package:code_magic_ex/ui/screens/login/state.dart';
import 'package:code_magic_ex/utilities/constants.dart';
import 'package:code_magic_ex/ui/global/widgets/custom_surfix_icon.dart';
import 'package:code_magic_ex/ui/global/widgets/default_button.dart';
import 'package:code_magic_ex/utilities/keyboard.dart';
import 'package:code_magic_ex/utilities/size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String email = kReleaseMode ? "" : "2970466";
  late String password = kReleaseMode ? "" : "1234";
  bool remember = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _onPressContinue() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      loginBloc.getLoginTokens(context);
      KeyboardUtil.hideKeyboard(context);
      // Navigator.pushNamed(context, MainHomeScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!kReleaseMode) {
      _userIdController.text = "2970466";
      _passwordController.text = "1234";
    }
    return StreamBuilder<LoginPageState>(
        stream: loginBloc.state,
        builder: (context, snapshot) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                buildUserIdFormField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                buildPasswordFormField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                Row(
                  children: [
                    Checkbox(
                      value: remember,
                      activeColor: Colors.blueAccent,
                      onChanged: (value) {
                        setState(() {
                          remember = value!;
                        });
                      },
                    ),
                    const Text("Remember me"),
                    const Spacer(),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, ScreenPaths.mainHome),
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                DefaultButton(
                  loading: snapshot.hasData && snapshot.data!.isLoading,
                  text: "Continue",
                  press: () => _onPressContinue(),
                ),
              ],
            ),
          );
        });
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          return kPassNullError;
        }
        return null;
      },
      controller: _passwordController,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        labelStyle: TextStyle(color: Colors.grey),
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildUserIdFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      validator: (value) {
        if (value!.isEmpty) {
          return kUserIdNullError;
        }
      },
      controller: _userIdController,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        labelStyle: TextStyle(color: Colors.grey),
        labelText: "User ID",
        hintText: "Enter your user id",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Account.svg"),
      ),
    );
  }
}
