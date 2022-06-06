import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surga_mainan/blocs/auth_bloc.dart';
import 'package:surga_mainan/theme/dark_color.dart';

class SignInPage extends StatefulWidget {
  final AuthBloc authBloc;
  const SignInPage({Key key, this.authBloc}) : super(key: key);


  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
   AuthBloc get _authBloc => widget.authBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authBloc,
      child: LoginForm(
        authBloc: _authBloc,
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final AuthBloc authBloc;
  LoginForm({Key key, this.authBloc}) : super(key: key);
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: textStyle.primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: textStyle.semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Silahkan Lengkapi Data untuk Melanjutkan',
              style: textStyle.subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: textStyle.primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: textStyle.medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: DarkColor.backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_email.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: textStyle.primaryTextStyle,
                        controller: emailController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Masukkan Alamat Email',
                          hintStyle: textStyle.subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: textStyle.primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: textStyle.medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: DarkColor.backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_password.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: textStyle.primaryTextStyle,
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Password',
                          hintStyle: textStyle.subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed:(){
            _login();
          },
          style: TextButton.styleFrom(
            backgroundColor: DarkColor.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Masuk',
            style: textStyle.primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: textStyle.medium,
            ),
          ),
        ),
      );
    }

    // Widget footer() {
    //   return Container(
    //     margin: EdgeInsets.only(bottom: 30),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text(
    //           'Belum Punya Akun? ',
    //           style: subtitleTextStyle.copyWith(
    //             fontSize: 12,
    //           ),
    //         ),
    //         GestureDetector(
    //           onTap: () {
    //             Navigator.pushNamed(context, '/sign-up');
    //           },
    //           child: Text(
    //             'Daftar Sekarang',
    //             style: purpleTextStyle.copyWith(
    //               fontSize: 12,
    //               fontWeight: medium,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }
    return Scaffold(
      backgroundColor:DarkColor.backgroundColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: gridValue.margin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              emailInput(),
              passwordInput(),
              signInButton(),
              Spacer(),
              // footer(),
            ],
          ),
        ),
      )
    );
  }

  void _login() {
    authBloc.add(LoginProcess(
      email: emailController.text,
      password: passwordController.text,
    ));
  }
  
}