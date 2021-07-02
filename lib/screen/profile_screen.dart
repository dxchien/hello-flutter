import 'package:flutter/material.dart';
import 'package:flutter_app/widget/app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final menus = <String>[];

  @override
  void initState() {
    menus.addAll([
      'Điểm tích luỹ',
      'Ví của tôi',
      'Quản lý chi tiêu',
      'Túi đồ',
      'Sổ địa chỉ',
      'Lịch sử giao dịch',
      'Danh bạ',
      'Quà tặng',
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Tài khoản',
        isBack: false,
        elevation: 1,
      ),
      backgroundColor: Colors.grey[100],
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildProfile(),
            const SizedBox(height: 8),
            buildMenu(),
            buildRating(),
          ],
        ),
      ),
    );
  }

  Widget buildProfile() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: Colors.white,
      child: Row(
        children: [
          CircleAvatar(
            child: Icon(Icons.person),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hieu Tao',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '0944556692',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              'Chưa xác thực',
              style: TextStyle(fontSize: 12, color: Colors.deepOrange),
            ),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.2),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 18,
            color: Colors.grey[500],
          ),
        ],
      ),
    );
  }

  Widget buildRating() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Đánh giá của bạn\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text:
                                  'Sẽ thật tuyệt vời nếu VinID nhận được đánh giá của bạn nhằm nâng cao chất lượng dịch vụ.',
                              style: TextStyle(color: Colors.grey[600])),
                        ], style: TextStyle(height: 1.5)),
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/img_rocket.png',
                    width: 100,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: Colors.grey[300],
                    size: 40,
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: Colors.grey[300],
                    size: 40,
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: Colors.grey[300],
                    size: 40,
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: Colors.grey[300],
                    size: 40,
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: Colors.grey[300],
                    size: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenu() {
    return Container(
      child: ListView.separated(
        itemBuilder: (ctx, index) {
          final menu = menus[index];
          return buildMenuItem(menu);
        },
        separatorBuilder: (ctx, index) => Container(
          color: Colors.white,
          child: Divider(
            height: 1,
            indent: 50
          ),
        ),
        itemCount: menus.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget buildMenuItem(String menu) {
    return GestureDetector(
      onTap: (){
        print('_ProfileScreenState.buildMenuItem');
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 32,
              child: Icon(Icons.account_balance_wallet, color: Colors.red,),
            ),
            Expanded(
              child: Text(menu, style: TextStyle(fontSize: 16),),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 18,
              color: Colors.grey[500],
            ),
          ],
        ),
      ),
    );
  }
}
