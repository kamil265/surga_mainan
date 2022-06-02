import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:surga_mainan/services/auth_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthServices authServices;

  AuthBloc({this.authServices}) : assert(authServices != null), super(null);

  @override
  AuthState get initialState => AuthInit();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthCheck) {
      yield AuthLoading();

      final hasToken = await authServices.hasToken();
      if (hasToken != null) {
        yield AuthHasToken(token: hasToken);
      } else {
        yield AuthFailed();
      }
    }

    if (event is GetDataWithToken) {
      yield AuthLoading();

      final user = await authServices.getData(event.token);
      yield AuthData(email: user.email, name: user.name);
    }

    if (event is LoginProcess) {
      yield AuthLoading();
      try {
        final login = await authServices.login();
        if (login.message != "failed") {
          yield LoginSuccess();
          await authServices.setLocalToken(login.data.token);
          yield AuthHasToken(token: login.data.token);
        }
      } catch (e) {
        yield LoginFailed("login gagal");
      }
    }

    // if (event is LoggedOut) {
    //   final String token = await authServices.hasToken();
    //   try {
    //     final Logout logout = await authServices.userLogout(token);
    //     if (logout.message == "success") {
    //       await authServices.unsetLocalToken();
    //       yield AuthFailed();
    //     }
    //   } catch (e) {}
    // }
  }
}
