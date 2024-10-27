class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginSuccess extends LoginStates {}

class LoginFailed extends LoginStates {
  final String errorMessage;

  LoginFailed(this.errorMessage);
}

class LoginLoading extends LoginStates {}
