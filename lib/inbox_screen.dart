import 'package:flutter/material.dart';
import 'package:flutter_app/utils/widget/app_bar.dart';

class InboxScreen extends StatefulWidget {
  final String title;

  const InboxScreen({Key? key, required this.title}) : super(key: key);

  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: "Hộp thư",
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          this.createMessenger();
        },
        icon: const Icon(Icons.add),
        label: Text("Tạo tin nhắn mới"),
        backgroundColor: Color(0xff2f6bff),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildBody() {
    return buildList();
  }

  Widget buildList() {
    return Container(
      child: ListView(
        children: [
          buildItem(
            header: "Thông báo",
            content: "Cập nhật thông tin giao dịch, hoàn tiền",
            date: "19/05/2021",
            isUnSeen: true,
            icon: Icons.add_alert,
            color: Color(0xffe7304e),
          ),
          buildItem(
            header: "Ưu đãi",
            content: "Đừng bỏ lỡ ưu đãi siêu hấp dẫn từ VinID",
            icon: Icons.card_giftcard,
            color: Color(0xff0ab63c),
          ),
          buildItem(
              header: "Tin tức",
              content: "Cập nhật các tính năng mới nhất của VinID",
              icon: Icons.speaker,
              color: Color(0xff1f6eff)),
        ],
      ),
    );
  }

  Widget buildItem({
    required String header,
    required String content,
    String date = "",
    bool isUnSeen = false,
    required IconData icon,
    Color color = Colors.blue,
  }) {
    return Container(
      height: 70,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Icon(
              icon,
              color: Colors.white,
            ),
            backgroundColor: color,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  header,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  content,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isUnSeen ? Colors.black87 : Colors.black26,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: 10,
                  color: isUnSeen ? Colors.black87 : Colors.black26,
                ),
              ),
              if (isUnSeen) ...[
                SizedBox(height: 5),
                Icon(
                  Icons.circle,
                  size: 10,
                  color: Colors.blue,
                )
              ]
            ],
          )
        ],
      ),
    );
  }

  void createMessenger() {
    print('_InboxScreenState.createMessenger');
  }
}
