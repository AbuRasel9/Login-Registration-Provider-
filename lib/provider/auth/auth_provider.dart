import 'package:flutter/cupertino.dart';
import 'package:untitled6/model/auth/login_request.dart';
import 'package:untitled6/model/auth/login_response.dart';
import 'package:untitled6/model/auth/registration_request.dart';
import 'package:untitled6/repo/sharePrefs/share_prefs.dart';
import 'package:untitled6/repo/sharePrefs/share_prefs_impl.dart';

import '../../model/auth/registration_response.dart';
import '../../repo/network_requester.dart';
import '../../utils/service/di_service.dart';

part 'auth_provider_impl.dart';



abstract class AuthProvider with ChangeNotifier{
  bool _isLoading=false;
  bool get isLoading=>_isLoading;

  LoginResponse? _loginResponse;
  LoginResponse?get loginResponse=>_loginResponse;

  Future<LoginResponse>login(LoginRequest loginRequest);

  Future<RegistrationResponse>registration(RegistrationRequest registrationRequest);

  void setLoading({required bool loading});
  Future<void> logout();


  //copy method use for login request



}