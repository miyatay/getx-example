import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_example/domain/entity/user.dart';

class ListController extends GetxController with StateMixin<List<User>> {
  @override
  void onInit() {
    super.onInit();
    // 今回はControllerの初期化でデータ取得
    fetch();
  }

  /// User一覧を取得
  Future<void> fetch() async {
    // 状態をローディングに設定
    change(null, status: RxStatus.loading());

    try {
      // 普通はここでAPIよぶ ------>
      final Iterable list = jsonDecode(json);
      final users = list.map((e) => User.fromJson(e)).toList();
      await Future<void>.delayed(const Duration(seconds: 2)); // ローディングが表示されるようにちょっと待つ
      // 普通はここでAPIよぶ <------

      // 状態を成功に設定
      change(users, status: RxStatus.success());
    } catch (e) {
      // TODO 適切な例外処理を書く
      // 状態をエラーに設定（今回は例外出ることはないがAPI呼び出す場合は必要になる）
      change(null, status: RxStatus.error());
    }
  }

  // ダミーのAPIレスポンス
  static const json = """
[
	{
		"name": "Hamilton Cobb",
		"email": "nonummy@hotmail.couk",
		"id": 1
	},
	{
		"name": "Indira Floyd",
		"email": "aliquam.eros@google.edu",
		"id": 2
	},
	{
		"name": "Colleen Nixon",
		"email": "molestie.orci@aol.ca",
		"id": 3
	},
	{
		"name": "Kelsey Slater",
		"email": "non.ante@protonmail.net",
		"id": 4
	},
	{
		"name": "Ivan Atkinson",
		"email": "sit.amet.consectetuer@protonmail.org",
		"id": 5
	},
	{
		"name": "Adele Flores",
		"email": "enim@icloud.ca",
		"id": 6
	},
	{
		"name": "Brenna Jordan",
		"email": "adipiscing.non@protonmail.net",
		"id": 7
	},
	{
		"name": "Frances Sharpe",
		"email": "at.lacus.quisque@google.ca",
		"id": 8
	},
	{
		"name": "Leandra Leblanc",
		"email": "sit.amet@yahoo.edu",
		"id": 9
	}
]
  """;
}
