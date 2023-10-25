import '../interfaces/i_http_client.dart';
import '../models/response.dart';
import 'package:http/http.dart' as http;


class HttpClient implements IHttpClient {
  @override
  Future<Response>? get(String authority,
      [String? unencodedPath, Map<String, dynamic>? queryParameters]) async {
    unencodedPath ??= "";
    var url = Uri.https(authority, unencodedPath, queryParameters);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return Response(responseCode: response.statusCode, data: response.body);
    } else {
      return Response(
          responseCode: response.statusCode, error: response.reasonPhrase);
    }
  }
}
