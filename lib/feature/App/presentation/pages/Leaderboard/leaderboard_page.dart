




import 'package:flutter/material.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LeaderBoard Page'),
      ),
      body: Center(
        child: Text('Welcome to the LeaderBoard!'),
      ),);
  }
}