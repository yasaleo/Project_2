part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool isLoading,
    required Option<Either<MainFailure, LoginResponse>> loginresponse,
     MainFailure? failure,
  }) = _LoginState;

  factory LoginState.intial() {
    return const LoginState(
      isLoading: false,
      loginresponse: None(),
      
    );
  }

  
}
