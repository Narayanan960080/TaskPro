import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_pro/View/DetailsView.dart';
import '../Model/Status.dart';
import '../ViewModel/ProductListVM.dart';




class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ProductListVM _api = ProductListVM();
  DateFormat dateFormat = DateFormat("dd MM yyyy");
  fetchData() async {
    Map<String,dynamic> params = {
      "pagination":"1"
    };
    _api.fetchMyFamilyList(params);
  }
  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }
  Future<bool> backBt(){
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width =  MediaQuery.of(context).size.width;
    return SafeArea(
        child: WillPopScope(
          onWillPop: ()=>backBt(),
          child: Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              backgroundColor: Colors.grey[200],
              elevation: 0,
              leading: Icon(Icons.home,color: Colors.grey,),
            ),
      body: ChangeNotifierProvider<ProductListVM>(
          create: (BuildContext context) => _api,
          child: Consumer<ProductListVM>(builder: (context, viewModel, _) {
            switch (viewModel.productsList.status) {
              case Status.LOADING:
                return  const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return  const Center(child: Text("No Data",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),));
              case Status.COMPLETED:
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount:  viewModel.productsList.data!.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: Offset(1, 3)
                              )
                            ]
                        ),
                        child:ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsView(data:  viewModel.productsList.data!.data![index])));
                          },
                          leading: Container(
                            height: height * 0.1,
                            width: width * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/foodList.jpg'),
                                fit: BoxFit.cover,
                              )
                            ),
                          ),
                          title: Text(viewModel.productsList.data!.data![index].name.toString()),
                          subtitle: Text(viewModel.productsList.data!.data![index].displayMode.toString()),
                          trailing: Text(dateFormat.format( DateTime.parse(viewModel.productsList.data!.data![index].createdAt.toString()))),
                        )
                      ),
                    );
                  },);
              default:
            }
            return Container();
          }),
      ),
    ),
        ));
  }
}
