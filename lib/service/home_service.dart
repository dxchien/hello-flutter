import 'package:flutter/material.dart';
import 'package:flutter_app/entity/fomo_menu.dart';
import 'package:flutter_app/entity/hot_menu.dart';
import 'package:flutter_app/entity/main_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<MainMenu> getMainMenus() {
  return [
    MainMenu("ic_service_voucher.png", "Voucher", false),
    MainMenu("ic_service_my_house.png", "Vinhomes", false),
    MainMenu("ic_service_game.png", "Săn thưởng", false),
    MainMenu("ic_service_utility_payment.png", "Tiện ích", false),
    MainMenu("ic_function_vinmart.png", "Vinmart", false),
    MainMenu("ic_function_maket.png", "Đi chợ", false),
    MainMenu("ic_function_food.png", "Ăn uống", false),
    MainMenu("ic_function_tech.png", "Techcom Rewards", true),
  ];
}

List<FomoMenu> getFomoMenus() {
  return [
    FomoMenu(
      "hot_product0.png",
      "Săn thưởng mỗi ngày, quà về đầy tay",
      "Tham gia ngay",
      Icons.wallet_giftcard_sharp,
    ),
    FomoMenu(
      "hot_product1.png",
      "Một hành động nhỏ bằng triệu nụ cười vui",
      "Tham gia ngay",
      Icons.wallet_giftcard_sharp,
    ),
    FomoMenu(
      "hot_product2.png",
      "Sale ào ào như mưa rào tháng 6",
      "Xem ngay",
      Icons.remove_red_eye,
    ),
    FomoMenu(
      "hot_product3.png",
      "Trời nắng hay mưa - Có VinID đưa tin",
      "Xem ngay",
      Icons.remove_red_eye,
    ),
    FomoMenu(
      "hot_product4.png",
      "Nhập mã ONHANHE - Miễn phí giao hàng",
      "Mua ngay",
      Icons.shopping_cart,
    ),
    FomoMenu(
      "hot_product5.png",
      "Quẹt thẻ Techcombank - Tích điểm VinID",
      "Tham gia ngay",
      Icons.wallet_giftcard_sharp,
    ),
    FomoMenu(
      "hot_product6.png",
      "Mở rộng tích điểm trên mọi giao dịch",
      "Xem ngay",
      Icons.remove_red_eye,
    ),
    FomoMenu(
      "hot_product7.png",
      "Quản lý chi tiêu thông minh cùng VinID",
      "Xem ngay",
      Icons.remove_red_eye,
    ),
  ];
}

List<HotMenu> getHotMenus() {
  return [
    HotMenu("hot-0.png", "Đi chợ VinMart Online cùng VinID, nhận ngay..."),
    HotMenu("hot-1.png", "CÙNG VINID CHUNG TAY XÂY TRƯỜNG MỚI"),
    HotMenu("hot-2.png", "Sale ào ào như mưa rào tháng 6"),
    HotMenu("hot-3.png", "Tự tin là chính mình, VinID yêu bạn"),
    HotMenu("hot-4.png", "Nâng tầm chuẩn sống với căn hộ \"trong mơ\""),
    HotMenu("hot-5.png", "Độc quyền tháng 6: Hàng tốt giá hời"),
    HotMenu("hot-6.png", "Quà đỉnh mỗi ngày - Quay là trúng tháng 6"),
    HotMenu("hot-7.png", "Bạn cứ ở nhà, chúng tôi giao hàng miễn phí"),
  ];
}

List<BottomNavigationBarItem> getBottomMenus() {
  return [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      label: "Trang chủ",
    ),
    BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.chessQueen, size: 20),
      label: "Đặc quyền",
    ),
    BottomNavigationBarItem(
      icon: Text(""),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.mail),
      label: "Hòm thư",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_rounded),
      label: "Tài khoản",
    ),
  ];
}
