import 'package:flutter/material.dart';

class searchPage extends StatelessWidget {
  const searchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          TextField(),
          SizedBox(height: 10,),
          Expanded(child: ListView.builder(
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('Item ${index + 10}'),
              );
            },
          ),)
        ],
      )
    );
  }
}
