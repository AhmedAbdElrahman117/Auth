class SignUpStates {}

class SignUpinitState extends SignUpStates {}

class SignUpLoading extends SignUpStates {}

class SignUpFailed extends SignUpStates {
  final String errorMessage;

  SignUpFailed({required this.errorMessage});
}

class SignUpSuccess extends SignUpStates {}
