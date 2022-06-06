import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surga_mainan/pages/shop_home/home_page.dart';
import 'package:surga_mainan/pages/shop_home/main_page.dart';
import 'package:surga_mainan/pages/sign_in_page.dart';
import 'package:surga_mainan/pages/splash_page.dart';
import 'package:surga_mainan/services/auth_services.dart';

import 'blocs/auth_bloc.dart';

// void main() {
//   final AuthServices authServices = AuthServices();
//   runApp(BlocProvider(
//     create: (context) {
//       return AuthBloc(authServices: authServices);
//     },
//     child: App(
//       authServices: authServices,
//       authBloc: AuthBloc(authServices: authServices),
//     ),
//   ));
// }

// class App extends StatelessWidget {
//   final AuthServices authServices;
//   final AuthBloc authBloc;

//   const App({Key key, this.authServices, this.authBloc}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BlocBuilder(
//         bloc: authBloc,
//         builder: (context, AuthState state) {
//           if (state is AuthInit) {
//             authBloc.add(AuthCheck());
//             return Container(
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }
//           if (state is AuthHasToken || state is AuthData)
//             return SignInPage(
//               authBloc: authBloc,
//             );
//           if (state is AuthFailed || state is LoginFailed)
//             return SignInPage(authBloc: authBloc);
//           if (state is AuthLoading)
//             return Container(
//               color: Colors.white,
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );

//           return Container();
//         },
//       ),
//     );
//   }
// }
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/shop-home': (context) => MainPage(),
      }),
    );
  }
}
