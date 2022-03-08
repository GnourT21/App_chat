import 'package:flash_chat/provider/auth.dart';
import 'package:flash_chat/ultilities/constrains.dart';
import 'package:flash_chat/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/my_btn.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
    _passController.dispose();
  }

  void trySubmid(BuildContext ctx) async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      Provider.of<AutheProvider>(ctx, listen: false).onSubmit(ctx);
    }
  }

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<AutheProvider>();
    final authPro = context.read<AutheProvider>();
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            !prov.isLogin
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.0),
                      boxShadow: const [kShadow],
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Username cannot empty!';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        authPro.displayName(value);
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your Username',
                      ),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
                boxShadow: const [kShadow],
              ),
              child: TextFormField(
                controller: _textController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email cannot empty!';
                  } else if (!value.contains('@') || !value.contains('.')) {
                    return 'Email is not valid!';
                  }
                  return null;
                },
                onChanged: (value) {
                  authPro.userMail(value);
                },
                keyboardType: TextInputType.emailAddress,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
                boxShadow: const [kShadow],
              ),
              child: TextFormField(
                controller: _passController,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password cannot empty!';
                  } else if (value.length < 6) {
                    return 'Password does not valid';
                  }
                  return null;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password',
                ),
                onChanged: (value) {
                  authPro.userPass(value);
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            !prov.isLogin
                ? Container(
                    margin: const EdgeInsets.only(bottom: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.0),
                      boxShadow: const [kShadow],
                    ),
                    child: TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value != _passController.text || value!.isEmpty) {
                          return 'Password does not match!';
                        }
                        return null;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Confirm your password',
                      ),
                    ),
                  )
                : const SizedBox(),
            MyBtn(
              onPress: () {
                trySubmid(context);
              },
              borderRad: 30.0,
              title: prov.isLogin ? 'Log In' : 'Sign Up',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  prov.isLogin
                      ? 'Don\'t have an account?'
                      : 'I already have an account',
                ),
                TextButton(
                  onPressed: () {
                    context.read<AutheProvider>().toggleSignInBtn();
                    _textController.clear();
                    _passController.clear();
                  },
                  child: GradientText(
                    text: prov.isLogin ? 'Sign Up' : 'Sign In',
                    gradient: kGradientColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
