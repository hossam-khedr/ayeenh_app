enum AuthStatus{init ,loading,failure,success}
extension AuthState on AuthStates{
  bool get isInitial=> authStatus == AuthStatus.init;
  bool get isLoading=> authStatus == AuthStatus.loading;
  bool get isFailure=> authStatus == AuthStatus.failure;
  bool get isSuccess=> authStatus == AuthStatus.success;
}
class AuthStates{
  String? errorMassage;
  AuthStatus authStatus;
  AuthStates({
    this.errorMassage ,
    this.authStatus = AuthStatus.init
});
  AuthStates copyWith({
    String? errorMassage,
    AuthStatus? authStatus
}){
    return AuthStates(
      authStatus: authStatus ?? this.authStatus,
      errorMassage: errorMassage ?? this.errorMassage
    );
  }

}