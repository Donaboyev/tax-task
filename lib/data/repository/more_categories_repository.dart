import 'package:tax_task/base/base_repository.dart';
import 'package:tax_task/data/data_sources/remote/remote_source.dart';
import 'package:tax_task/data/model/request/register_request.dart';

class MoreCategoriesRepository extends BaseRepository {
  final RemoteSource? remoteSource;

  MoreCategoriesRepository({required this.remoteSource})
      : assert(remoteSource != null);

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
}
