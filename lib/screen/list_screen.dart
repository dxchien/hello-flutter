import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  final String title;

  const ListScreen({Key? key, required this.title}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Demo"),
      ),
      body: buildList3(),
    );
  }

  Widget buildList() {
    return Container(
      child: ListView(
        children: [
          buildItem(),
          buildItem(),
          buildItem(),
          buildItem(),
          buildItem(),
        ],
      ),
    );
  }

  Widget buildList2() {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return buildItem(index: index);
      },
      itemCount: 100,
    );
  }

  Widget buildList3() {
    return ListView.separated(
        itemCount: 100,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return buildItem(index: index);
        });
  }

  Widget buildItem({int index = 0}) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            child: Text("$index"),
          ),
          SizedBox(width: 16),
          Text("Cu Dau $index")
        ],
      ),
    );
  }
}
