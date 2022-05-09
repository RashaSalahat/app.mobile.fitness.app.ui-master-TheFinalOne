import 'package:http/http.dart' as http;

//we're just gonna use the get method
class NetworkHelper {
  Future<http.Response> get(String endpoint) async {
    var url = Uri.parse(endpoint);
    var response = await http.get(url);
    return response;
  }
}
