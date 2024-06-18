
                          // CONTROLLER(obs)  or  Provider(ViewModel)


import 'package:get/get.dart';
import 'package:getx_exmple/Model/categorymodel.dart';
import 'package:getx_exmple/WebService/webservice.dart';

class HomeController extends GetxController {
 final _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
 final List<CategoryModel> _categories = <CategoryModel>[].obs;
  List<CategoryModel> get categories => _categories;



logindata(
      String username, String password) async {
//  late  Map<String,dynamic> registrationResult;
    
       final result = await Webservice().login( username, password);
       print("result in homecontroller= $result");
    return result;

}





registrationdata(
      String name, String phone, String address, String username, String password) async {
//  late  Map<String,dynamic> registrationResult;
    
       final result = await Webservice().registration(name, phone, address, username, password);
    return result;
// print(registrationResult);
//       if (registrationResult.toString().contains("success")) {
//         // Successful registration
//         return true;
//       print('registration success');
//       } else {
//         return false;
//         // Handle registration failure
//         print('Registration failed');
//         // return false;
//       }
   
  }






  //  @override
  // void onInit() {
  //   fetchCategorydata(); // Load categories when the controller initializes
  //   super.onInit();
  // }

  Future<void> fetchCategorydata() async {
    _isLoading.value = true;

    try {
      var fetchedCategories = await Webservice().fetchCategory();
      // print(fetchedCategories);
      _categories.assignAll(fetchedCategories);

        } catch (e) {
      // Handle error
      print('Error fetching category: $e');
    } finally {
      _isLoading.value = false;
    }
  }


  // void increment() {
  //   count++;
  // }

  // void decrement(){
  //   count--;
  // }
}