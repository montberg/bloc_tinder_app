import '../models/response.dart';

class IHttpClient {
  Future<Response>? get(String authority,
      [String? unencodedPath, Map<String, dynamic>? queryParameters]) async {
    return Response(responseCode: -1);
  }
}
