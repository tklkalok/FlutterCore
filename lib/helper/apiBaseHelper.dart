import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  final String _baseUrl = 'api.themoviedb.org';

  Future<dynamic> get(String subPath, Map<String, dynamic> params) async {
    var responseJson;
    Uri requestUri = new Uri.http(_baseUrl, '/3'+subPath, params);
    try {
      final response = await http.get(requestUri);
      responseJson = _returnResponse(response);
    } on SocketException{
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response){
    var responseStr = response.body.toString();
    var responseCode = response.statusCode;
    switch (responseCode){
      case 200:
        var responseJson = json.decode(responseStr);
        //print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(responseStr);
      case 401:
      case 403:
        throw UnauthorisedException(responseStr);
      case 500:
      default:
        throw FetchDataException('Error occured with statusCode: $responseCode');
    }
  }
}

class AppException implements Exception{
  final _message;
  final _prefix;

  //Constructor
  AppException([
    this._message,
    this._prefix
  ]);
  
  String toString(){
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException{
  FetchDataException([
    String? message
  ]) : super(message, "Error During Communicatio: "); 
}

class BadRequestException extends AppException{
  BadRequestException([
    String? message
  ]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException{
  UnauthorisedException([
    String? message
  ]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException{
  InvalidInputException([
    String? message
  ]) : super(message, "Invalid Input: ");
}