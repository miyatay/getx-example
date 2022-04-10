import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_example/domain/entity/user_detail.dart';

class DetailController extends GetxController with StateMixin<UserDetail> {
  @override
  void onInit() {
    super.onInit();
    // 今回はControllerの初期化でデータ取得
    fetch();
  }

  /// User一覧を取得
  Future<void> fetch() async {
    final id = Get.arguments[0];

    // 状態をローディングに設定
    change(null, status: RxStatus.loading());

    try {
      // 普通はここでAPIよぶ ------>
      final Iterable list = jsonDecode(json);
      final users = list.map((e) => UserDetail.fromJson(e)).toList();
      await Future<void>.delayed(const Duration(seconds: 1)); // ローディングが表示されるようにちょっと待つ
      // 普通はここでAPIよぶ <------

      // 状態を成功に設定
      change(users[id-1], status: RxStatus.success());
    } catch (e) {
      // TODO 適切な例外処理を書く
      // 状態をエラーに設定（今回は例外出ることはないがAPI呼び出す場合は必要になる）
      change(null, status: RxStatus.error());
    }
  }


  static const json = '''
[
	{
		"name": "Hamilton Cobb",
		"email": "nonummy@hotmail.couk",
		"id": 1,
		"phone": "1-781-206-3474",
		"country": "Costa Rica",
		"city": "Raurkela"
	},
	{
		"name": "Indira Floyd",
		"email": "aliquam.eros@google.edu",
		"id": 2,
		"phone": "1-685-727-5630",
		"country": "Nigeria",
		"city": "Rezzoaglio"
	},
	{
		"name": "Colleen Nixon",
		"email": "molestie.orci@aol.ca",
		"id": 3,
		"phone": "(612) 880-8457",
		"country": "South Korea",
		"city": "Murmansk"
	},
	{
		"name": "Kelsey Slater",
		"email": "non.ante@protonmail.net",
		"id": 4,
		"phone": "(862) 687-7959",
		"country": "Brazil",
		"city": "San Piero a Sieve"
	},
	{
		"name": "Ivan Atkinson",
		"email": "sit.amet.consectetuer@protonmail.org",
		"id": 5,
		"phone": "1-294-870-2157",
		"country": "Belgium",
		"city": "Cali"
	},
	{
		"name": "Adele Flores",
		"email": "enim@icloud.ca",
		"id": 6,
		"phone": "1-248-823-2328",
		"country": "Mexico",
		"city": "Honolulu"
	},
	{
		"name": "Brenna Jordan",
		"email": "adipiscing.non@protonmail.net",
		"id": 7,
		"phone": "(755) 622-1457",
		"country": "Brazil",
		"city": "Stavanger"
	},
	{
		"name": "Frances Sharpe",
		"email": "at.lacus.quisque@google.ca",
		"id": 8,
		"phone": "1-356-172-1753",
		"country": "Singapore",
		"city": "Vienna"
	},
	{
		"name": "Leandra Leblanc",
		"email": "sit.amet@yahoo.edu",
		"id": 9,
		"phone": "(893) 306-6463",
		"country": "United Kingdom",
		"city": "Carmen"
	}
]
  ''';
}