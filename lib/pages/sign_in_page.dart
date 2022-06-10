import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surga_mainan/providers/token_provider.dart';
import 'package:surga_mainan/theme/dark_color.dart';
import 'package:surga_mainan/widgets/loading_button.dart';
import 'package:surga_mainan/widgets/primary_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // form key
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    TokenProvider tokenProvider = Provider.of<TokenProvider>(context);
    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await tokenProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: DarkColor.secondaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            content: Text(
              'Selamat Datang',
              style: textStyle.primaryTextStyle.copyWith(
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
        Navigator.pushNamedAndRemoveUntil(
            context, '/home', (Route<dynamic> route) => true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: DarkColor.alertColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            content: Text(
              'Login Gagal',
              style: textStyle.primaryTextStyle.copyWith(
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: textStyle.primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 2.0,
            ),
            Text('Sign In to Countinue', style: textStyle.subtitleTextStyle)
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: const EdgeInsets.only(top: 70.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: textStyle.primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.normal, //medium
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
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
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: textStyle.primaryTextStyle.copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: textStyle.subtitleTextStyle.copyWith(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
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
        margin: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: textStyle.primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.normal, //medium
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
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
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: _isHidden,
                        style: textStyle.primaryTextStyle.copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: textStyle.subtitleTextStyle.copyWith(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: _toggleVisibility,
                      child: Icon(
                        _isHidden
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        size: 22.0,
                        color: _isHidden ? DarkColor.subtitleColor : DarkColor.primaryColor,
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

    
    return Scaffold(
      backgroundColor: DarkColor.backgroundColor1,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height - 20,
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  header(),
                  emailInput(),
                  passwordInput(),
                  isLoading
                      ? LoadingButton(
                          text: "Loading",
                          margin_top: 30.0,
                          press: handleSignIn,
                        )
                      : PrimaryButton(
                          text: "Sign In",
                          margin_top: 30.0,
                          press: handleSignIn,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}