part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool isLoading,
    required Option<Either<MainFailure, LoginResponse>> loginOption,
     MainFailure? failure,
     LoginResponse? loginResponse
  }) = _LoginState;

  factory LoginState.intial() {
    return const LoginState(
      isLoading: false,
      loginOption: None(),
      
    );
  }

  
}
