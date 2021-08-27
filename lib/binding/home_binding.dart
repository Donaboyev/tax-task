import 'package:get/get.dart';
import 'package:tax_task/controller/home_controller.dart';
import 'package:tax_task/data/data_sources/remote/home_remote_source.dart';
import 'package:tax_task/data/network/api_client.dart';
import 'package:tax_task/data/repository/home_repository.dart';

class HomeBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    final homeRepository = HomeRepository(
      remoteSource: HomeRemoteSource(ApiClient.getInstance()),
    );
    await Get.putAsync<HomeController>(
      () async => HomeController(repository: homeRepository),
    );
  }
}
