import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ewallet_app/models/signin_form_model.dart';
import 'package:ewallet_app/models/signup_form_model.dart';
import 'package:ewallet_app/models/user_edit_form_model.dart';
import 'package:ewallet_app/models/user_model.dart';
import 'package:ewallet_app/services/auth_service.dart';
import 'package:ewallet_app/services/user_service.dart';
import 'package:ewallet_app/services/wallet_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());
          final response = await AuthService().checkEmail(event.email);

          if (response == false) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(const AuthFailed('Email sudah terpakai'));
          }
        } catch (e) {
          emit(AuthFailed("Email tidak sesuai Format"));
        }
      }

      if (event is AuthRegister) {
        try {
          emit(AuthLoading());

          final user = await AuthService().register(event.data!);

          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthLogin) {
        try {
          emit(AuthLoading());
          final user = await AuthService().login(event.data!);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed("Login Failed, Something wrong with Email/Password"));
        }
      }

      if (event is AuthGetCurrentUser) {
        try {
          emit(AuthLoading());
          final SigninFormModel? data =
              await AuthService().getCredentialFromLocal();

          final user = await AuthService().login(data!);
          print("success");
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthUpdateUser) {
        try {
          if (state is AuthSuccess) {
            final updatedUser = (state as AuthSuccess).user.copyWith(
                username: event.data!.username,
                name: event.data!.name,
                email: event.data!.email,
                password: event.data!.password);

            emit(AuthLoading());

            await UserService().updateUser(event.data!);
            emit(AuthSuccess(updatedUser));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
      if (event is AuthUpdatePin) {
        try {
          if (state is AuthSuccess) {
            final updatedUser =
                (state as AuthSuccess).user.copyWith(pin: event.newPin);
            emit(AuthLoading());

            await WalletService().updatePin(event.oldPin!,event.newPin!);

            emit(AuthSuccess(updatedUser));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
