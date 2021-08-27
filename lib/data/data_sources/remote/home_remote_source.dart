import 'package:dio/dio.dart';
import 'package:tax_task/data/data_sources/remote/response_handler.dart';
import 'package:tax_task/data/data_sources/remote/server_error.dart';
import 'package:tax_task/data/model/response/categories_response.dart';
import 'package:tax_task/data/model/response/products_response.dart';
import 'package:tax_task/data/model/response/register_response.dart';
import 'package:tax_task/data/model/request/register_request.dart';
import 'package:tax_task/data/network/api_client.dart';

class HomeRemoteSource {
  ApiClient? _apiClient;

  HomeRemoteSource(this._apiClient) : assert(_apiClient != null);

  Future<ResponseHandler<RegisterResponse>> getToken(
      {required RegisterRequest registerRequest}) async {
    RegisterResponse response;
    try {
      response = await _apiClient!.getToken(registerRequest);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<ResponseHandler<ProductsResponse>> searchProduct({
    required String language,
    required String query,
    required String token,
  }) async {
    ProductsResponse response;
    try {
      response = await _apiClient!.searchProduct(language, query, token);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<ResponseHandler<CategoriesResponse>> getCategories({
    required int page,
    required int size,
    required String token,
  }) async {
    CategoriesResponse response;
    try {
      response = await _apiClient!.getCategories(page, size, token);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }
}
