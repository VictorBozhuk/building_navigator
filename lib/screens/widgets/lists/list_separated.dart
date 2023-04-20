import 'package:flutter/material.dart';

class ListSeparated extends StatelessWidget {
  final Widget Function(int index) itemBuilder;
  final int length;
  const ListSeparated({super.key, required this.itemBuilder, required this.length});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (buildContext, index){
        return itemBuilder(index);
      },
      separatorBuilder: (buildContext,index)
      {
        return const Divider(height: 5);
      },
      itemCount: length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5 ),
      scrollDirection: Axis.vertical,
    );
  }

}