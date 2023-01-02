part of 'logged_user_details_bloc.dart';

abstract class LoggedUserDetailsState extends Equatable {
  const LoggedUserDetailsState();
  
  @override
  List<Object> get props => [];
}

class LoggedUserDetailsInitial extends LoggedUserDetailsState {}
