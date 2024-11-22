//
// abstract class AuthStates{}
// class AuthIntial extends AuthStates{}
// class LoginLoading extends AuthStates{}
// class LoginSucess extends AuthStates{}
// class LoginError extends AuthStates{
//   String error;
//   LoginError(this.error);
// }
// class RegisterLoading extends AuthStates{}
// class RegisterSucess extends AuthStates{}
// class RegisterError extends AuthStates{
//   String error;
//   RegisterError(this.error);
// }
abstract class AuthStates{}
class AuthIntial extends AuthStates{}
class RegisterLoading extends AuthStates{}
class RegisterSucess extends AuthStates{}
class RegisterError extends AuthStates{
  final String error;

  RegisterError(this.error);
}
class LoginLoading extends AuthStates{}
class LoginSucess extends AuthStates{}
class LoginError extends AuthStates{
  final String error;

  LoginError(this.error);
}
class LogOutLoading extends AuthStates{}
class LogOutSucess extends AuthStates{}
class LogOutError extends AuthStates{
  final String error;

  LogOutError(this.error);
}