import 'package:get/get.dart';
import 'package:tax_task/base/base_controller.dart';
import 'package:tax_task/core/constants/app_constants.dart';
import 'package:tax_task/core/custom_widgets/flappy_search_bar/flappy_search_bar.dart';
import 'package:tax_task/data/data_sources/local/local_source.dart';
import 'package:tax_task/data/model/request/register_request.dart';
import 'package:tax_task/data/model/response/categories_response.dart';
import 'package:tax_task/data/model/response/popular_response.dart';
import 'package:tax_task/data/model/response/products_response.dart';
import 'package:tax_task/data/model/response/register_response.dart';
import 'package:tax_task/data/repository/home_repository.dart';

class HomeController extends BaseController {
  final HomeRepository? repository;

  HomeController({required this.repository}) : assert(repository != null);

  SearchBarController<Product>? searchBarController;
  List<Category> _categories = <Category>[];
  List<PopularProduct> _popularProducts = <PopularProduct>[];
  LocalSource _localSource = LocalSource.getInstance();

  @override
  Future<void> onInit() async {
    searchBarController = SearchBarController<Product>();
    await getToken().then((value) => {getCategories(), getPopularProducts()});
    super.onInit();
  }

  Future<void> getToken() async {
    setLoading(true);
    RegisterRequest request = RegisterRequest(
        certificateId: '',
        orgTin: '',
        signData: AppConstants.SIGN_DATA,
        viaDirectorKey: 0);
    final result = await repository!.getToken(registerRequest: request);
    setLoading(false);
    if (result is RegisterResponse) {
      _localSource.setAccessToken(result.token!.jwtToken!);
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<void> getCategories() async {
    setLoading(true);
    final result = await repository!.getCategories(
      page: 0,
      size: AppConstants.CATEGORY_SIZE,
      token: 'Bearer ${_localSource.getAccessToken()}',
    );
    setLoading(false);
    if (result is CategoriesResponse) {
      _categories = result.data!;
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<void> getPopularProducts() async {
    setLoading(true);
    final result = await repository!.getPopularProducts(
      token: 'Bearer ${_localSource.getAccessToken()}',
    );
    setLoading(false);
    if (result is PopularResponse) {
      _popularProducts = result.data!;
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<List<Product>> searchProduct(String query) async {
    setLoading(true);
    final result = await repository!.searchProducts(
      language: AppConstants.LANG_UZ_CYRL,
      query: query,
      token: _localSource.getAccessToken(),
    );
    setLoading(false);
    if (result is ProductsResponse) {
      return result.data!;
    } else {
      Get.snackbar('error'.tr, result.toString());
      return [];
    }
  }

  List<Category> get categories => _categories;

  List<PopularProduct> get popularProducts => _popularProducts;
}
