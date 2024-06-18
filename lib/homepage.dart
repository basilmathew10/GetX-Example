
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_exmple/Controller(Obs)/controller.dart';
import 'package:getx_exmple/details.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    final HomeController controller=Get.put(HomeController());


  @override
  void initState() {
    super.initState();
    _fetchData();
   
  }

  Future<void> _fetchData() async {
    await controller.fetchCategorydata();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'E-COMMERCE',
          style:TextStyle(color:Color.fromARGB(255, 238, 238, 242)),
        ),
              backgroundColor: const Color.fromARGB(255, 4, 1, 36),

      ),
      

      body: Center(
        child: _buildHomePage(),
      ),
    );
  }

  Widget _buildHomePage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: const Text(
            'Category',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        FutureBuilder(
      future: controller.fetchCategorydata(), // Assuming fetchCategories is a method in your controller
      builder: (context, snapshot) {
        //  print("l=="+controller.categories.length.toString());
        if (controller.categories.isNotEmpty) {
          return SizedBox(
            height: 80,
            child: Obx(() => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    // print("l=="+controller.categories.length.toString());
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const Details(
                                // catid: c.to.categories[index].id!,
                                // catname: YourController.to.categories[index].category!,
                              ));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                          child: Center(
                            child: Text(
                              controller.categories[index].category!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ),



        
                                                //     Container(
                                                //       padding: EdgeInsets.all(16),
                                                //       child: const Text(
                                                //         "Offer Products",
                                                //         style: TextStyle(
                                                //           fontSize: 23,
                                                //           color: Color.fromARGB(255, 4, 1, 36),
                                                //           fontWeight: FontWeight.bold,
                                                //         ),
                                                //       ),
                                                //     ),
                                                      
                                                      
                                                //         Expanded(
                                                //           child: FutureBuilder<List<ProductModel>>(
                                                //             future: futurePost,
                                                //             builder: (context, snapshot) {
                                                //               if (snapshot.hasData) {
                                                //                 return GridView.builder(
                                                //                   physics: const BouncingScrollPhysics(),
                                                //                   shrinkWrap: true,
                                                //                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                //                     crossAxisCount: 2,
                                                //                     crossAxisSpacing: 8,
                                                //                     mainAxisSpacing: 8,
                                                //                   ),
                                                //                   itemCount: snapshot.data!.length,
                                                //                   itemBuilder: (BuildContext context, int index) {
                                                //                     final post = snapshot.data![index];
                                                //                     return Container(
                                                //                       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                //                       padding: EdgeInsets.all(20.0),
                                                //                       decoration: BoxDecoration(
                                                //                         color: Colors.white,
                                                //                         borderRadius: BorderRadius.circular(15.0),
                                                //                       ),
                                                //                       child: Column(
                                                //                         mainAxisAlignment: MainAxisAlignment.start,
                                                //                         crossAxisAlignment: CrossAxisAlignment.start,
                                                //                         children: [
                                                //                           AspectRatio(
                                                //                             aspectRatio: 3 / 2,
                                                //                             child: GestureDetector(
                                                //                                 onTap: () {
                                                //                                                             Navigator.of(context).push(
                                                //                                                               MaterialPageRoute(
                                                //                                                                 builder: (context) => LoginPage()
                                                // //                                                          (product: post,
                                                // //                                           //                       id: post.id,
                                                // //                                           // name: post.prodname,
                                                // //                                           // image:"http://bootcamp.cyralearnings.com/products/${post.image}",
                                                // //                                           // price: post.price.toString(),
                                                // //                                           // description: post.description), 
                                                //                                                               ),
                                                //                                                             );
                                                //                                                       },
                                                //                               child: Image.network(
                                                //                                 "http://bootcamp.cyralearnings.com/products/${post.image}",
                                                //                                 fit: BoxFit.cover,
                                                //                               ),
                                                //                             ),
                                                //                           ),
                                                //                           Text(
                                                //                             "${snapshot.data![index].prodname}",
                                                //                             style: TextStyle(
                                                //                               fontSize: 16.0,
                                                //                               fontWeight: FontWeight.bold,
                                                //                             ),
                                                //                           ),
                                                //                           Text(
                                                //                             "Rs:${snapshot.data![index].price}",
                                                //                             style: TextStyle(
                                                //                               color: Colors.red.shade900,
                                                //                               fontSize: 17,
                                                //                               fontWeight: FontWeight.w600,
                                                //                             ),
                                                //                           ),
                                                //                         ],
                                                //                       ),
                                                //                     );
                                                //                   },
                                                //                 );
                                                //               } else {
                                                //                 return Center(child: CircularProgressIndicator());
                                                //               }
                                                //             },
                                                //           ),
                                                //         ),
      ],
    );
  }
}