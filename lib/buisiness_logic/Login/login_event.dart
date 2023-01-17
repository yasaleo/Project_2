part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.loginRequested(
    {
      required String email,
      required String password
    }
  ) = LoginRequested;
}