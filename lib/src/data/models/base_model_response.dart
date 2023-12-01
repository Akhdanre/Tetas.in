class BaseModelResponse {
  final dynamic data;
  final dynamic errors;

  BaseModelResponse({
    required this.data,
    required this.errors,
  });

  factory BaseModelResponse.fromJson(Map<String, dynamic> json) {
    return BaseModelResponse(
      data: json['data'],
      errors: json['errors'],
    );
  }
}
