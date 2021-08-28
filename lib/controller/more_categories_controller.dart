import 'package:get/get.dart';
import 'package:tax_task/base/base_controller.dart';
import 'package:tax_task/core/constants/app_constants.dart';
import 'package:tax_task/data/data_sources/local/local_source.dart';
import 'package:tax_task/data/model/response/categories_response.dart';
import 'package:tax_task/data/repository/more_categories_repository.dart';

class MoreCategoriesController extends BaseController {
  final MoreCategoriesRepository? repository;

  MoreCategoriesController({required this.repository})
      : assert(repository != null);

  List<Category> _categories = <Category>[];
  LocalSource _localSource = LocalSource.getInstance();
  int _page = 0;
  final RxBool _hasNextCategory = true.obs;
  final RxBool _isCategoryLoading = false.obs;

  @override
  Future<void> onInit() async {
    await getCategories();
    super.onInit();
  }

  Future<void> getCategories() async {
    if (!_hasNextCategory.value) return;
    if (_page == 0)
      setLoading(true);
    else
      _isCategoryLoading.value = true;
    final result = await repository!.getCategories(
      page: _page,
      size: AppConstants.CATEGORY_SIZE,
      token: 'Bearer ${_localSource.getAccessToken()}',
    );
    _isCategoryLoading.value = false;
    setLoading(false);
    if (result is CategoriesResponse) {
      _page++;
      if (result.data!.length < AppConstants.CATEGORY_SIZE)
        _hasNextCategory.value = false;
      _categories.addAll(result.data!);
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  List<Category> get categories => _categories;

  RxBool get isCategoryLoading => _isCategoryLoading;

  RxBool get hastNextCategory => _hasNextCategory;
}
