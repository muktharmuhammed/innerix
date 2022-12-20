import 'package:flutter/material.dart';
import 'package:innerix_mvvm/resources/components/add_item.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../data/response/status.dart';
import '../model/user_products_model.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_model/home_view_model.dart';
import '../view_model/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  int counter =0;

  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    homeViewModel.fetchProductsListApi();
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          Center(
            child: InkWell(
              onTap: (){
                userPreference.remove().then((value){
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: const Text('logout',style: TextStyle(color: Colors.blue),),
            ),
          ),
          const SizedBox(width: 20,)
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create:(BuildContext context) => homeViewModel,
         child:Consumer<HomeViewModel>(builder:(context,value, _) {
           switch (value.productsList.status){
             case Status.LOADING:
               return const Center(child: CircularProgressIndicator());
             case Status.ERROR:
               return Center(
                 child: Text(value.productsList.message.toString()),
               );
             case Status.COMPLETED:
               return SingleChildScrollView(
                 child: Padding(
                   padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
                   child: Column(
                     children: [
                       Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Row(
                             children: const [
                               Text('JSW BILL',
                                 style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                     fontSize: 15
                                 ),
                               ),
                               Icon(
                                 Icons.keyboard_arrow_down_outlined,
                               )
                             ],
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               const CircleAvatar(
                                 radius: 5,
                                 backgroundColor: Colors.green,
                               ),
                               const SizedBox(width: 5,),
                               const Text('connected'),
                               const SizedBox(width: 5,),
                               Image.asset('assets/images/Vector.png',scale: 4,)

                             ],
                           ),

                         ],
                       ),
                       const SizedBox(height: 10,),
                       Padding(
                         padding: const EdgeInsets.only(left: 10,right: 10),
                         child: SizedBox(
                           width: MediaQuery.of(context).size.width,
                           child: TextFormField(
                             decoration:   InputDecoration(
                                 prefixIcon: const Icon(Icons.search,
                                     color: Colors.grey),
                                 fillColor: Colors.grey.shade100,
                                 filled: true,
                                 hintText: 'search for products',
                                 hintStyle: const TextStyle(
                                   color: Colors.grey,
                                 ),
                                 focusedBorder: OutlineInputBorder(
                                     borderSide:
                                     BorderSide(color: Colors.grey.shade200),
                                     borderRadius: BorderRadius.circular(10)),
                                 enabledBorder: OutlineInputBorder(
                                     borderSide:
                                     BorderSide(color: Colors.grey.shade200),
                                     borderRadius: BorderRadius.circular(10))

                             ),
                           ),
                         ),
                       ),
                       DefaultTabController(
                           length: 3,
                           initialIndex: 0,
                           child: Column(
                             children: [
                               Material(
                           textStyle: const TextStyle(
                           color: Colors.red,
                               fontWeight: FontWeight.bold),
                           borderRadius: BorderRadius.circular(0),
                           color: Colors.white,
                           child: const TabBar(
                             labelColor: Colors.black,
                               indicatorColor: Colors.blue,
                               tabs: [
                                 Tab(
                                   text: "Mobiles",
                                 ),
                                 Tab(
                                   text: "Fashion",
                                 ),
                                 Tab(
                                   text: "Electronics",
                                 ),
                               ])
                               )
                             ],
                           )),
                       const SizedBox(height: 5,),
                       ListView(
                         shrinkWrap: true,
                         physics: const NeverScrollableScrollPhysics(),
                         children:
                         List.generate(value.productsList.data!.products!.length, (index) =>
                         value.productsList.data!.products![index].category=='Mobiles'? AddItem(

                           itemName: value.productsList.data!.products![index].name.toString(),

                           description: value.productsList.data!.products![index].description.toString(),

                           price: value.productsList.data!.products![index].retailPrice,

                           image: value.productsList.data!.products![index].image,

                         ):const Text('')
                         ),
                       )
                     ],
                   ),
                 ),
               );
           }
           return Container();

         })),
      bottomNavigationBar:
      Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
            selectedItemColor: Colors.blueAccent,
            showSelectedLabels: true,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            selectedLabelStyle:const TextStyle(color: Colors.black) ,
            items: [
              BottomNavigationBarItem(icon:
              Image.asset('assets/images/Vector (3).png',scale: 3,),
                  label: 'Home'),
              BottomNavigationBarItem(icon: Image.asset('assets/images/admin.png',scale: 3),label: 'Admin'),
              BottomNavigationBarItem(icon: Image.asset('assets/images/sales.png',scale: 3),label: 'Sales'),
              BottomNavigationBarItem(icon: Image.asset('assets/images/bills.png',scale: 3),label: 'Bills'),
              BottomNavigationBarItem(icon: Image.asset('assets/images/person.png',scale: 3),label: 'Profile')

            ]),
      ),
    );
  }
}
