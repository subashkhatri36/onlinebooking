class ApiCall {
  dynamic response;
  String error;
  bool iserror;
  ApiCall({
    this.response,
    this.error = '',
    this.iserror = false,
  });
}
