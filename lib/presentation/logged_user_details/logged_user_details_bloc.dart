import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'logged_user_details_event.dart';
part 'logged_user_details_state.dart';

class LoggedUserDetailsBloc extends Bloc<LoggedUserDetailsEvent, LoggedUserDetailsState> {
  LoggedUserDetailsBloc() : super(LoggedUserDetailsInitial()) {
    on<LoggedUserDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
