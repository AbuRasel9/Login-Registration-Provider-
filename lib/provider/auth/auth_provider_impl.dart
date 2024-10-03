part of'auth_provider.dart';
class AuthProviderImpl extends AuthProvider{


  @override
  void setLoading({required bool loading}) {
    _isloading=loading;
    notifyListeners();
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest)async {

      LoginResponse result=await NetworkRequester().loginApi(loginRequest);
      _loginResponse=result;
      notifyListeners();

      return result ;
  }

  @override
  Future<RegistrationResponse> registration(RegistrationRequest registrationRequest) async {
     return await NetworkRequester().registrationApi(registrationRequest);

  }

}