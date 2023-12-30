


import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homme Page'),
      ),
      body: Center(
        child: Text('Welcome to the HomePage!'),
      ),);
  }
}