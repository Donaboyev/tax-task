import 'package:get/get.dart';
import 'package:tax_task/controller/more_categories_controller.dart';
import 'package:tax_task/data/data_sources/remote/remote_source.dart';
import 'package:tax_task/data/network/api_client.dart';
import 'package:tax_task/data/repository/more_categories_repository.dart';

class MoreCategoriesBinding implements Bindings {
  @override
  void dependencies() async {
    var moreRepository = MoreCategoriesRepository(
      remoteSource: RemoteSource(
        ApiClient.getInstance()!,
      ),
    );
    Get.lazyPut<MoreCategoriesController>(
      () => MoreCategoriesController(repository: moreRepository),
    );
  }
}
