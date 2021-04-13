import 'package:get/get.dart';

class Controller extends GetxController {
  //متغییر قسمت نویگیشن بار
  final activclick = 0.obs;
//تخفیف دارد یا ندارد
  final off = 0.obs;
//فعال یا فعال نبودن دسته بندی
  final catActive = 0.obs;
//مراحل ثبت نام
  final activeStepOne = 0.obs;
  final activeSteptwo = 0.obs;
  final activeStepthree = 0.obs;
  final activeStepcomplete = 0.obs;
  final stepPlus = 0.obs;
}
