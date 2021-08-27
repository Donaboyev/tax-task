import 'package:tax_task/base/base_repository.dart';
import 'package:tax_task/data/data_sources/remote/home_remote_source.dart';
import 'package:tax_task/data/model/request/register_request.dart';

class HomeRepository extends BaseRepository {
  final HomeRemoteSource? remoteSource;

  HomeRepository({required this.remoteSource}) : assert(remoteSource != null);

  Future<dynamic> getToken({required RegisterRequest registerRequest}) async {
    final response =
        await remoteSource!.getToken(registerRequest: registerRequest);
    if (response.data != null) {
      return response.data;
    } else if (response.getException().getErrorMessage() != "Canceled") {
      return await getErrorMessage(response.getException().getErrorMessage());
    }
  }

  Future<dynamic> searchProducts({
    required String language,
    required String query,
    required String token,
  }) async {
    final response = await remoteSource!.searchProduct(
      language: language,
      query: query,
      token: token,
    );
    if (response.data != null) {
      return response.data;
    } else if (response.getException().getErrorMessage() != "Canceled") {
      return await getErrorMessage(response.getException().getErrorMessage());
    }
  }

  Future<dynamic> getCategories({
    required int page,
    required int size,
    required String token,
  }) async {
    final response = await remoteSource!.getCategories(
      page: page,
      size: size,
      token: token,
    );
    if (response.data != null) {
      return response.data;
    } else if (response.getException().getErrorMessage() != "Canceled") {
      return await getErrorMessage(response.getException().getErrorMessage());
    }
  }

  Future<dynamic> getPopularProducts({required String token}) async {
    final response = await remoteSource!.getPopularProducts(token: token);
    if (response.data != null) {
      return response.data;
    } else if (response.getException().getErrorMessage() != "Canceled") {
      return await getErrorMessage(response.getException().getErrorMessage());
    }
  }
}
