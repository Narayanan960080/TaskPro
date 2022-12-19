import 'package:flutter/material.dart';

import '../Model/Response/ProductListData.dart';




class DetailsView extends StatefulWidget {
  final Data data;
  const DetailsView({Key? key, required this.data}) : super(key: key);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}
class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width =  MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
       appBar: AppBar(
         backgroundColor: Colors.grey[200],
         elevation: 0,
         leading: InkWell(
             onTap: (){
               Navigator.pop(context);
             },
             child: const Icon(Icons.arrow_back_ios,color: Colors.black54,)),

       ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height * 0.4,
              width: width * 0.9,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/food.jpg'),
                    fit: BoxFit.fill,
                  ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
               SizedBox(width: width * 0.07),
              Text("Title:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              const SizedBox(width: 10,),
              Text(widget.data.name.toString(),style: TextStyle(color: Colors.black54),),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: width * 0.07),
              Text("Mode:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              const SizedBox(width: 10,),
              Text(widget.data.displayMode.toString(),style: TextStyle(color: Colors.black54),),
            ],
          )
        ],
      ),


    );
  }
}
