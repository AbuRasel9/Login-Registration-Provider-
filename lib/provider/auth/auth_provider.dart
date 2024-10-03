import 'package:flutter/cupertino.dart';
import 'package:untitled6/model/auth/login_request.dart';
import 'package:untitled6/model/auth/login_response.dart';
import 'package:untitled6/model/auth/registration_request.dart';
import 'package:untitled6/network_requester/network_requester.dart';

import '../../model/auth/registration_response.dart';

part 'auth_provider_impl.dart';



abstract class AuthProvider with ChangeNotifier{
  bool _isloading=false;
  bool get isLoading=>_isloading;

  LoginResponse? _loginResponse;
  LoginResponse?get loginResponse=>_loginResponse;

  Future<LoginResponse>login(LoginRequest loginRequest);

  Future<RegistrationResponse>registration(RegistrationRequest registrationRequest);

  void setLoading({required bool loading});

}