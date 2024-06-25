import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:espeats/src/Base/ApiService/app_error.dart';


abstract class _Exceptions {
  static String socketExceptionMessage = "No hay conexión:C ";
  static String httpException = "No se pudo encontrar el Path";
  static String formatException = "Formato incorrecto";
}

abstract class ApiService {
  Future<Map<String, dynamic>> getDataFromPostRequest(
      {required Map<String, dynamic> bodyParameters,
      required String url,
      Map<String, String>? headers});
  Future<Map<String, dynamic>> getDataFromPutRequest(
      {required Map<String, dynamic> bodyParameters,
      required String url,
      Map<String, String>? headers});
  Future<Map<String, dynamic>> getDataFromGetRequest(
      {required String url, Map<String, String>? headers});
}

class DefaultApiService extends ApiService {
  @override
  Future<Map<String, dynamic>> getDataFromGetRequest(
      {required String url, Map<String, String>? headers}) async {
    final _url = Uri.parse(url);
    final response = await http.get(_url, headers: headers);

    try {
      if (response.statusCode.toString().contains('20')) {
        //Fue llamada correcta
        var jsonData = jsonDecode(response.body);
        if (jsonData == null){
          throw Failure.fromMessage(message:  _Exceptions.formatException);
        }else{
          return jsonData;
        }
      } else {
        //Tuvo algun error
        throw Failure.fromBody(body: response.body);
      }
    } on SocketException {
      throw Failure.fromMessage(message: _Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: _Exceptions.httpException);
    } on FormatException {
      throw Failure.fromMessage(message: _Exceptions.formatException);
    }
  }

  @override
  Future<Map<String, dynamic>> getDataFromPostRequest(
      {required Map<String, dynamic> bodyParameters,
      required String url,
      Map<String, String>? headers}) async {
    // TODO: implement getDataFromPostRequest
    final _url = Uri.parse((url));
    final body = json.encode(bodyParameters);
    final response = await http.post(_url, headers: headers, body: body);

    try {
      if (response.statusCode.toString().contains('20')) {
        //Fue llamada correcta
        var jsonData = jsonDecode(response.body);
        if (jsonData == null){
          throw Failure.fromMessage(message:  _Exceptions.formatException);
        }else{
          return jsonData;
        }
      } else {
        //Tuvo algun error
        throw Failure.fromBody(body: response.body);
      }
    } on SocketException {
      throw Failure.fromMessage(message: _Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: _Exceptions.httpException);
    } on FormatException {
      throw Failure.fromMessage(message: _Exceptions.formatException);
    }
  }

  @override
  Future<Map<String, dynamic>> getDataFromPutRequest(
      {required Map<String, dynamic> bodyParameters,
      required String url,
      Map<String, String>? headers}) async {
    final _url = Uri.parse(url);
    final body = json.encode(bodyParameters);
    final response = await http.put(_url, headers: headers, body: body);
    try {
      if (response.statusCode.toString().contains('20')) {
        //Fue llamada correcta
        var jsonData = jsonDecode(response.body);
        if (jsonData == null){
          throw Failure.fromMessage(message:  _Exceptions.formatException);
        }else{
          return jsonData;
        }
      } else {
        //Tuvo algun error
        throw Failure.fromBody(body: response.body);
      }
    } on SocketException {
      throw Failure.fromMessage(message: _Exceptions.socketExceptionMessage);
    } on HttpException {
      throw Failure.fromMessage(message: _Exceptions.httpException);
    } on FormatException {
      throw Failure.fromMessage(message: _Exceptions.formatException);
    }
  }
}
