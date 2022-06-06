import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surga_mainan/blocs/auth_bloc.dart';
import 'package:surga_mainan/services/auth_services.dart';
import 'package:surga_mainan/theme/dark_color.dart';

class HomePage extends StatefulWidget {
  final AuthBloc authBloc;
  const HomePage({Key key, this.authBloc}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthServices authServices = AuthServices();
  AuthBloc get _authBloc => widget.authBloc;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthBloc, AuthState>(
        bloc: _authBloc,
        builder: (context, state) {
          if (state is AuthHasToken) 
          {
              _authBloc.add(GetDataWithToken(state.token));
              return Container();
          }
          if (state is AuthData) {
          return Container(
            margin: EdgeInsets.only(
              top: defaultMargin().margin,
              left: defaultMargin().margin,
              right: defaultMargin().margin,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo,' + state.name,
                        style: DarkColor.primaryTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        state.email,
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // image: DecorationImage(
                    //   image: NetworkImage(
                    //     user.profilePhotoUrl,
                    //   ),
                    // ),
                  ),
                ),
              ],
            ),
          );
        }
        },
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: primaryColor,
                ),
                child: Text(
                  'Semua',
                  style: primaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: subtitleColor,
                  ),
                  color: transparentColor,
                ),
                child: Text(
                  'PT Putra Terang Agung',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: subtitleColor,
                  ),
                  color: transparentColor,
                ),
                child: Text(
                  'Terang Agung',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget catProductsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Kategori Produk',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    // Widget catProducts() {
    //   return Container(
    //     margin: EdgeInsets.only(
    //       top: 14,
    //     ),
    //     child: Column(
    //       children: [ProductCatList()]
    //     ),
    //   );
    // }

    return BlocBuilder<AuthBloc, AuthState>(
        bloc: _authBloc,
        builder: (context, state) {
          if (state is AuthHasToken) {
            _authBloc.add(GetDataWithToken(state.token));
            return Container();
          }
          if (state is AuthData) {
            return ListView(
              children: [
                header(),
                categories(),
                catProductsTitle(),
                // catProducts()
              ],
            );
          }
        });
  }
}
