// ignore_for_file: must_be_immutable, non_constant_identifier_names

part of 'Auth_bloc.dart';

@immutable
 class AuthState {


  dynamic WidgetLoadingLogin = false;
  dynamic WidgetLoading = false;
  dynamic index  ;

  bool ShowPassword = true;

  dynamic iconData = Icons.visibility_outlined;


  lol(){
    if(iconData == Icons.visibility_outlined){
      iconData =Icons.visibility_off_sharp ;
      ShowPassword = false ;
    }else{
      iconData = Icons.visibility_outlined ;
      ShowPassword = true ;
    }

  }

  //   defalut(){
  //   AuthBloc x = AuthBloc() ;
  //   x.state.iconData =  Icons.visibility_outlined ;
  //   x.state.showpass = false ;
  //   return x ;
  // }
  //
  //   ShowPassword(AuthBloc c){
  //   AuthBloc x = AuthBloc() ;
  //   x.state.iconData = c.state.iconData = Icons.visibility_off_sharp ;
  //   x.state.showpass = c.state.showpass = false ;
  //   return x ;
  // }
  //   NoShowPassword(AuthBloc c){
  //   AuthBloc x = AuthBloc() ;
  //   x.state.iconData = c.state.iconData = Icons.visibility_outlined ;
  //   x.state.showpass = c.state.showpass = true ;
  //   return x ;
  // }

  List<Tile> UserData=[] ;
  final user = FirebaseAuth.instance.currentUser ;
  var formKeyLogin = GlobalKey<FormState>();


  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  /// Variables SingUp Screen

  var fromKeyRegister = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController emailSingUp = TextEditingController();
  TextEditingController passwordSingUp = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController Brand = TextEditingController();



  /// validator of TextFiled

  ErrorEmail(TextEditingController controller,
      {required String val, required String ErrorSpace}) {
    !EmailValidator.validate(val) ? 'Put Your $ErrorSpace' : null;
    if (val.isEmpty) {
      controller.text;
      return 'Put Your $ErrorSpace';
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(val)) {
      return 'Must Your Email include @example.com';
    }
    return null;
  }

  ErrorPassword(TextEditingController controller,
      {required String? val, required String ErrorSpace}) {
    if (val!.isEmpty) {
      controller.text;
      return 'Put Your $ErrorSpace';
    }
    if (controller.text.length < 6) {
      controller.text;
      return 'you should but a least 6 letter';
    }
    return null;
  }

  ErrorPublic(TextEditingController controller,
      {required String? val, required String ErrorSpace}) {
    if (val!.isEmpty) {
      controller.text;
      return 'Put Your $ErrorSpace';
    }
    return null;
  }



}

class AuthInitial extends AuthState {}

class LoadingState extends AuthState {
  dynamic IsLoading ;
  LoadingState({required this.IsLoading});
}
class LoadingStateSingIn extends AuthState {
  dynamic IsLoading ;
  LoadingStateSingIn({required this.IsLoading});
}



class SuccessSingInWithAuthState extends AuthState {}

class FaliureSingInWithAuthState extends AuthState {
  dynamic error;
  dynamic Form;

  FaliureSingInWithAuthState(this.error , this.Form);
}

class LoadingStateRegister extends AuthState {
  dynamic IsLoading ;
  LoadingStateRegister({required this.IsLoading});
}

class SuccessRegisterWithState extends AuthState {}

class FaliureRegisterWithState extends AuthState {
  dynamic error;

  FaliureRegisterWithState(this.error);
}

class LoadingShowPasswordState extends AuthState {}

class ShowPasswordState extends AuthState {
  dynamic icon;


  ShowPasswordState({required this.icon });
}

class DisAppearPasswordState extends AuthState {
  dynamic icon;


  DisAppearPasswordState({required this.icon });
}

class FaliurePasswordState extends AuthState {}




class LoadingLogOutState extends AuthState {}

class SuccessLogOutState extends AuthState {}

class FaliureLogOutState extends AuthState {
  dynamic Error;
  FaliureLogOutState({required this.Error});
}

