import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task_pro/View/HomeView.dart';




class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  route(){
    Timer(const Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeView()));

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    route();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width =  MediaQuery.of(context).size.width;
    return Scaffold(
      body:Center(
        child:    Lottie.asset('assets/images/splashAni.json',height: height* 0.43),
      ),
    );
  }
}
