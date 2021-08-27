import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/http.dart';
import 'package:tax_task/core/constants/app_constants.dart';
import 'package:tax_task/data/model/request/register_request.dart';
import 'package:tax_task/data/model/response/categories_response.dart';
import 'package:tax_task/data/model/response/popular_response.dart';
import 'package:tax_task/data/model/response/products_response.dart';
import 'package:tax_task/data/model/response/register_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConstants.BASE_URL)
abstract class ApiClient {
  static Alice alice = Alice(
    showNotification: true,
    showInspectorOnShake: false,
    darkTheme: false,
  );

  static get getDio {
    Dio dio = Dio(BaseOptions(followRedirects: false));
    if (kDebugMode) dio.interceptors.add(alice.getDioInterceptor());
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        request: true,
      ),
    );
    return dio;
  }

  static ApiClient? _apiClient;

  static ApiClient? getInstance({String baseUrl = AppConstants.BASE_URL}) {
    if (_apiClient != null)
      return _apiClient;
    else {
      _apiClient = ApiClient(getDio, baseUrl);
      return _apiClient;
    }
  }

  factory ApiClient(Dio dio, String baseUrl) {
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @POST('e-imzo')
  Future<RegisterResponse> getToken(@Body() RegisterRequest apiKey);

  @GET('mxik/search')
  Future<ProductsResponse> searchProduct(
    @Query('lang') String language,
    @Query('search_text') String query,
    @Header('Authorization') String token,
  );

  @GET('group')
  Future<CategoriesResponse> getCategories(
    @Query('page') int page,
    @Query('size') int size,
    @Header('Authorization') String token,
  );

  @GET('mxik/popular')
  Future<PopularResponse> getPopularProducts(
    @Header('Authorization') String token,
  );
}
