import 'package:flutter/material.dart';
import 'package:flutter_app/utils/entity/fomo_menu.dart';
import 'package:flutter_app/utils/entity/hot_menu.dart';
import 'package:flutter_app/utils/entity/main_menu.dart';

List<MainMenu> getMainMenus() {
  List<MainMenu> list = [];
  list.add(MainMenu("ic_service_voucher.png", "Voucher", false));
  list.add(MainMenu("ic_service_my_house.png", "Vinhomes", false));
  list.add(MainMenu("ic_service_game.png", "Săn thưởng", false));
  list.add(MainMenu("ic_service_utility_payment.png", "Tiện ích", false));
  list.add(MainMenu("ic_function_vinmart.png", "Vinmart", false));
  list.add(MainMenu("ic_function_maket.png", "Đi chợ", false));
  list.add(MainMenu("ic_function_food.png", "Ăn uống", false));
  list.add(MainMenu("ic_function_tech.png", "Techcom Rewards", true));
  return list;
}

List<FomoMenu> getFomoMenus() {
  List<FomoMenu> list = [];
  list.add(FomoMenu(
    "hot_product0.png",
    "Săn thưởng mỗi ngày, quà về đầy tay",
    "Tham gia ngay",
    Icons.wallet_giftcard_sharp,
  ));
  list.add(FomoMenu(
    "hot_product1.png",
    "Một hành động nhỏ bằng triệu nụ cười vui",
    "Tham gia ngay",
    Icons.wallet_giftcard_sharp,
  ));
  list.add(FomoMenu(
    "hot_product2.png",
    "Sale ào ào như mưa rào tháng 6",
    "Xem ngay",
    Icons.remove_red_eye,
  ));
  list.add(FomoMenu(
    "hot_product3.png",
    "Trời nắng hay mưa - Có VinID đưa tin",
    "Xem ngay",
    Icons.remove_red_eye,
  ));
  list.add(FomoMenu(
    "hot_product4.png",
    "Nhập mã ONHANHE - Miễn phí giao hàng",
    "Mua ngay",
    Icons.shopping_cart,
  ));
  list.add(FomoMenu(
    "hot_product5.png",
    "Quẹt thẻ Techcombank - Tích điểm VinID",
    "Tham gia ngay",
    Icons.wallet_giftcard_sharp,
  ));
  list.add(FomoMenu(
    "hot_product6.png",
    "Mở rộng tích điểm trên mọi giao dịch",
    "Xem ngay",
    Icons.remove_red_eye,
  ));
  list.add(FomoMenu(
    "hot_product7.png",
    "Quản lý chi tiêu thông minh cùng VinID",
    "Xem ngay",
    Icons.remove_red_eye,
  ));
  return list;
}

List<HotMenu> getHotMenus() {
  List<HotMenu> list = [];
  list.add(HotMenu("hot-0.png", "Đi chợ VinMart Online cùng VinID, nhận ngay..."));
  list.add(HotMenu("hot-1.png", "CÙNG VINID CHUNG TAY XÂY TRƯỜNG MỚI"));
  list.add(HotMenu("hot-2.png", "Sale ào ào như mưa rào tháng 6"));
  list.add(HotMenu("hot-3.png", "Tự tin là chính mình, VinID yêu bạn"));
  list.add(HotMenu("hot-4.png", "Nâng tầm chuẩn sống với căn hộ \"trong mơ\""));
  list.add(HotMenu("hot-5.png", "Độc quyền tháng 6: Hàng tốt giá hời"));
  list.add(HotMenu("hot-6.png", "Quà đỉnh mỗi ngày - Quay là trúng tháng 6"));
  list.add(HotMenu("hot-7.png", "Bạn cứ ở nhà, chúng tôi giao hàng miễn phí"));
  return list;
}