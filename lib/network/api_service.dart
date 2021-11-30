import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:project_beta/network/api_endpoint.dart';
import 'package:dio/dio.dart' as DioApi;
import 'package:project_beta/utils/shared_preference_local_storage.dart';

class ApiService {
  static late Dio _dio;

  static void init() async {
    var accessToken = await SharedPreferenceLocalStorage.getAccessToken();
    var options = BaseOptions(
      baseUrl: ApiEndpoint.HOST_URL,
    );

    _dio = Dio(options);

    print("auth : $accessToken");
    _dio.options.headers["Authorization"] = "Bearer " + accessToken.toString();
    _dio.options.headers["Content-Type"] = "application/x-www-form-urlencoded";
  }

  static Future<dynamic> postRequest(
      {required endpoint, param: const {"": ""}}) async {
    try {
      print("--------------------");
      print("REQUEST TYPE : POST ");
      print("REQUEST END POINT : $endpoint");
      print("REQUEST DATA : $param");

      DioApi.Response response = await _dio.post(endpoint, data: param);
      return response;
    } on Exception catch (err) {
      print(err.toString());
      return null;
    }
  }

  static Future<dynamic> putRequest(
      {required endpoint, param: const {"": ""}, id}) async {
    try {
      print("--------------------");
      print("REQUEST TYPE : PUT ");
      print("REQUEST END POINT : $endpoint" + "/" + id.toString());
      print("REQUEST DATA : $param");

      DioApi.Response response =
          await _dio.put(endpoint + "/" + id.toString(), data: param);
      return response;
    } on Exception catch (err) {
      print(err.toString());
      return null;
    }
  }

  static Future<dynamic> deleteRequest({required endpoint, id}) async {
    try {
      print("--------------------");
      print("REQUEST TYPE : delete ");
      print("REQUEST END POINT : $endpoint" + "/" + id.toString());

      DioApi.Response response =
          await _dio.delete(endpoint + "/" + id.toString());
      return response;
    } on Exception catch (err) {
      print(err.toString());
      return null;
    }
  }

  static Future<dynamic> getRequest({endpoint, param: const {"": ""}}) async {
    try {
      print("--------------------");
      print("REQUEST TYPE : GET ");
      print("REQUEST END POINT : $endpoint");
      print("REQUEST DATA : $param");

      DioApi.Response response =
          await _dio.get(endpoint, queryParameters: param);
      return response;
    } on Exception catch (err) {
      print(err.toString());
      return null;
    }
  }

  static void getAuthToken() async {
    var accessToken = await SharedPreferenceLocalStorage.getAccessToken();

    if (accessToken != null && !accessToken.toString().trim().isEmpty) {
      init();
      return;
    }

    DioApi.Response response;

    var clientID = ApiEndpoint.DEV_CLIENT_ID;
    var clientSecret = ApiEndpoint.DEV_CLIENT_SECRET;
    var dio = DioApi.Dio();
    var clientCredentials =
        Base64Encoder().convert("$clientID:$clientSecret".codeUnits);

    dio.options.headers['Content-Type'] = ApiEndpoint.DEV_CONTENT_TYPE;
    dio.options.headers['Authorization'] = 'Basic $clientCredentials';

    response =
        await dio.post(ApiEndpoint.HOST_URL + ApiEndpoint.AUTH_TOKEN, data: {
      'username': ApiEndpoint.DEV_USERNAME,
      'password': ApiEndpoint.DEV_PASSWORD,
      'grant_type': ApiEndpoint.DEV_GRANT_TYPE,
    });

    await SharedPreferenceLocalStorage.setAccessToken(
        response.data["access_token"]);
    await SharedPreferenceLocalStorage.setAccessTokenType(
        response.data["token_type"]);
    await SharedPreferenceLocalStorage.setRefreshToken(
        response.data["refresh_token"]);
    init();
  }

  static Future<Response> registerUser({data}) async {
    var response =
        await postRequest(endpoint: ApiEndpoint.CREATE_USER, param: data);
    print("registerUser response : $response");
    return response;
  }

  static Future<Response> getCategory({data}) async {
    var response =
        await postRequest(endpoint: ApiEndpoint.MASTER_CATEGORY, param: data);
    return response;
  }

  static Future<Response> getAllPost() async {
    var response = await getRequest(endpoint: ApiEndpoint.GET_POST);
    return response;
  }

  static Future<Response> addPostData({data}) async {
    var response =
        await postRequest(endpoint: ApiEndpoint.CREATE_POST, param: data);
    return response;
  }

  static Future<Response> updatePostData({data, id}) async {
    var response = await putRequest(
        endpoint: ApiEndpoint.UPDATE_POST, param: data, id: id);
    return response;
  }

  static Future<Response> deletePostData({id}) async {
    var response =
        await deleteRequest(endpoint: ApiEndpoint.DELETE_POST, id: id);
    return response;
  }

  static Future<Response> getPostSearch({data}) async {
    var response =
        await postRequest(endpoint: ApiEndpoint.SEARCH_POST, param: data);
    return response;
  }

  static Future<Response> postComments({id}) async {
    var response = await getRequest(
        endpoint: ApiEndpoint.COMMENT_POST + "/" + id.toString());
    return response;
  }

  static Future<Response> likePost({data}) async {
    var response =
        await postRequest(endpoint: ApiEndpoint.LIKE_POST, param: data);
    return response;
  }

  static Future<Response> isVerified({required String id}) async {
    var response =
        await postRequest(endpoint: ApiEndpoint.IS_VERIFIED + "/" + id);
    return response;
  }
}
