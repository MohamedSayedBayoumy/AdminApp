// ignore_for_file: must_be_immutable, non_constant_identifier_names

part of 'Auth_bloc.dart';

@immutable
class AuthEvent {
  List<String> lop = [];

}


class LoginWithAuthEvent extends AuthEvent {
  dynamic email  ;
  dynamic password  ;
  dynamic context  ;
  dynamic Key  ;
  LoginWithAuthEvent({required this.Key,required this.email, required this.password, required this.context});
}

class RegisterEvent extends AuthEvent {
   dynamic email     ;
   dynamic password  ;
   dynamic username  ;
   dynamic phone     ;
   dynamic Brand     ;

  dynamic context ;
  dynamic image ;
  RegisterEvent(
      {required this.email,
      required this.image,
      required this.password,
      required this.Brand,
      required this.username,
      required this.context,
      required this.phone});
}


class pass extends AuthEvent{
  dynamic icon ;
  dynamic show ;
  pass({required this.show,required this.icon, });
}
class ShowPasswordEvent extends AuthEvent {
  dynamic iconData;


  ShowPasswordEvent({required this.iconData });
}

class DisAppearPasswordEvent extends AuthEvent {}

class ShowEvent extends AuthEvent {
  dynamic iconData;
  dynamic showPassword;

  ShowEvent({required this.iconData, required this.showPassword});
}

class LogOutEvent  extends AuthEvent {
  dynamic context ;
  LogOutEvent ({required this.context}) ;
}
