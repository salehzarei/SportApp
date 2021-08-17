import 'package:get/get.dart';
import 'package:sportapplication/controller/Functions/AppFunction.dart';
import 'package:sportapplication/controller/Functions/ArticleFunction.dart';
import 'package:sportapplication/controller/Functions/Controller.dart';
import 'package:sportapplication/controller/Functions/GalleryFunction.dart';
import 'package:sportapplication/controller/Functions/PackageFunction.dart';
import 'package:sportapplication/controller/Functions/PlanFunction.dart';
import 'package:sportapplication/controller/Functions/ProfileFunction.dart';
import 'package:sportapplication/controller/Functions/ProfileFunctions.dart';
import 'package:sportapplication/controller/Functions/RegisterFunction.dart';
import 'package:sportapplication/controller/Functions/SliderFunction.dart';
import 'package:sportapplication/controller/Functions/SubSetFunctoin.dart';

class AllControllerBinding implements Bindings{
  
  @override
  void dependencies() {
    Get.lazyPut<AppFunction>(() => AppFunction()); // here!
    Get.lazyPut<ArticleFunction>(() => ArticleFunction()); // here!
    Get.lazyPut<RegisterFunction>(() => RegisterFunction()); // here!
    Get.lazyPut<PackageFunction>(() => PackageFunction()); // here!
    Get.lazyPut<SliderFunction>(() => SliderFunction()); // here!
    Get.lazyPut<Controller>(() => Controller()); // here!
    Get.lazyPut<SubSetFunction>(() => SubSetFunction()); // here!
    Get.lazyPut<ProfileFunction>(() => ProfileFunction()); // here!
    Get.lazyPut<ProfileFunctions>(() => ProfileFunctions()); // here!
    Get.lazyPut<PlanFunction>(() => PlanFunction()); // here!
    Get.lazyPut<GalleryFunction>(() => GalleryFunction()); // here!
    // Get.put(AppFunction());
    // Get.put(ArticleFunction());
    // Get.put(RegisterFunction());
    // Get.put(PackageFunction());
    // Get.put(SliderFunction());
    // Get.put(Controller());
    // Get.put(SubSetFunction());
    // Get.put(ProfileFunctions());
    // Get.put(ProfileFunction());
    // Get.put(PlanFunction());
    // Get.put(GalleryFunction());
  }

}