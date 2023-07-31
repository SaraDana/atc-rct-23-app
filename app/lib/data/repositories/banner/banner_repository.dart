//IMPORT INTERN APP
import 'package:app/models/banner_model.dart';

abstract class BaseBannerRepository {
  Future<List<CustomBanner>> getBanners();
  Future<List<CustomBannerScreen>> getBannerScreens(String? id);
  Future<void> updatePhone(String phone);
}
