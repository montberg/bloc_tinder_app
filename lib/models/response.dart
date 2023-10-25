class Response {
  final String?data;
  final String? error;
  final int responseCode;

  Response({this.data, this.error, required this.responseCode});
}