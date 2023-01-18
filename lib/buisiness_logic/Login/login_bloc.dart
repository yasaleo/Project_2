import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:project_2/data_layer/failures/main_failiure.dart';
import 'package:project_2/data_layer/model/login_response_model.dart';
import 'package:project_2/data_layer/repositeries/authrepo/login/i_login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';


@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ILoginRepo loginRepo;
  LoginBloc(this.loginRepo) : super(LoginState.intial()) {
    on<LoginRequested>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        loginOption: none(),
      ));
      final responseOption = await loginRepo.loginUser(
        email: event.email,
        password: event.password,
      );
      emit(responseOption.fold(
        (error) => state.copyWith(
          isLoading: false,
          
          loginOption: some(
            left(error),
          ),
          failure: error,
        ),
        (sucess) => state.copyWith(
          isLoading: false,
          loginOption: some(
            right(sucess),
          ),
          failure: null,
          loginResponse: sucess,
        ),
      ));
    });
  }
}
