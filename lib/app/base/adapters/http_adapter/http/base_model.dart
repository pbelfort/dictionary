class BaseResponseModel<T> {
  final T data;
  final int statusCode;

  BaseResponseModel({
    required this.data,
    required this.statusCode,
  });

  factory BaseResponseModel.fromApiResponse(
    T data,
    int statusCode,
  ) {
    return BaseResponseModel(
      data: data,
      statusCode: statusCode,
    );
  }
}
