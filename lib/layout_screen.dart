import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  final String title;

  const LayoutScreen({Key? key, required this.title}) : super(key: key);

  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      color: Colors.yellow,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("text1"),
          blueBox(),
          Text("text2"),
          Row(
            children: [
              Container(
                color: Colors.red,
                child: Text("123"),
              ),
              blueBox(),
              blueBox(),
              blueBox(),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                      "Chiều 22-6, Trung tâm Kiểm soát bệnh tật TP.HCM (HCDC) cho biết tính từ 6 giờ đến 18 giờ cùng ngày, TP.HCM ghi nhận thêm 100 ca nhiễm COVID-19."))
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text("Title"),
              ),
              Icon(Icons.info),
              Icon(Icons.arrow_forward_ios_outlined),
            ],
          ),
          Row(
            children: [
              Expanded(child: blueBox(), flex: 1,),
              Expanded(child: redBox(), flex: 10,),
            ],
          )
        ],
      ),
    );
  }

  Widget blueBox() {
    return Container(
      color: Colors.blue,
      child: SizedBox(
        width: 50,
        height: 50,
      ),
    );
  }

  Widget redBox() {
    return Container(
      color: Colors.red,
      child: SizedBox(
        width: 50,
        height: 50,
      ),
    );
  }
}
