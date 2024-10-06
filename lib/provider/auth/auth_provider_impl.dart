part of'auth_provider.dart';
class AuthProviderImpl extends AuthProvider{

  //create dependency injection instance for share preference
  final diSharePrefs=di<SharePrefs>();


  @override
  void setLoading({required bool loading}) {
    _isLoading=loading;
    notifyListeners();
  }

  @override
  Future<LoginResponse> login(LoginRequest loginRequest)async {

      LoginResponse result=await NetworkRequester().loginApi(loginRequest);
      diSharePrefs.setToken(value: result.token ?? "");

      _loginResponse=result;
      notifyListeners();

      return result ;
  }

  @override
  Future<RegistrationResponse> registration(RegistrationRequest registrationRequest) async {
     return await NetworkRequester().registrationApi(registrationRequest);

  }

  @override
  Future<void> logout() async {
    //when user click logout button than all sharepreference Data are clear
     await diSharePrefs.clearAuthData();
    notifyListeners();

  }

}