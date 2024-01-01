import 'package:flutter/material.dart';

class LastSentPageView extends StatefulWidget {
  const LastSentPageView ({super.key});

  @override
  State<LastSentPageView> createState() => _LastSentPageViewState();
}

class _LastSentPageViewState extends State<LastSentPageView> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
                key: const PageStorageKey('pageTwo'),
                itemCount: 50,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item ${index + 10}'),
                  );
                },
              );
  
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}