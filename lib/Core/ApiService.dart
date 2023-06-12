// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = "https://api.github.com/users/";
  final Dio _dio;

  ApiService(this._dio);

  Future<List<dynamic>> fetchRepos({required String url}) async {
    var response = await _dio.get(url);
    return response.data;
  }

  Future<Map<String, dynamic>> fetchUser(
      {required String githubUsername}) async {
    var response = await _dio.get("$_baseUrl$githubUsername");
    return response.data;
  }

  Future<Map<String, dynamic>> fetchTechUsed({required String endPoint}) async {
    var response = await _dio.get(endPoint);
    return response.data;
  }
}
