import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {

  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      print(response.request!.url);
      responseJson = returnResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future postResponse(String url, Map<String, String> JsonBody) async{
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(baseUrl + url),body: JsonBody);
      responseJson = returnResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        // throw BadRequestException(response.toString());
      case 401:
      case 403:
        // throw UnauthorisedException(response.body.toString());
      case 404:
        // throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        // throw FetchDataException(
        //     'Error occured while communication with server' +
        //         ' with status code : ${response.statusCode}');
    }
  }
}


abstract class BaseApiService {

  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<dynamic> getResponse(String url);
  Future<dynamic> postResponse(String url,Map<String, String> jsonBody);

}