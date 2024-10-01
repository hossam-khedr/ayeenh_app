enum RequestStatus{
  init,
  loading,
  success,
  failure,
  selectedData
}
extension RequestStatusEnum on RequestUserStates {
  bool get isInitial => status == RequestStatus.init;

  bool get isLoading => status == RequestStatus.loading;

  bool get isFailure => status == RequestStatus.failure;

  bool get isSuccess => status == RequestStatus.success;

  bool get isSelectedData => status == RequestStatus.selectedData;
}

class RequestUserStates{
   RequestStatus status;
   String? errorMassage;
   RequestUserStates({
     this.errorMassage,
     this.status = RequestStatus.init
});

   RequestUserStates copyWith(
       {String? errorMassage,
         RequestStatus? status,
         }) {
     return RequestUserStates(
       errorMassage: errorMassage ?? this.errorMassage,
       status: status ?? this.status,
     );
   }
}