import 'package:quize_app_bsp_tech/helper/server_helper.dart';
import 'package:quize_app_bsp_tech/utils/api_url.dart';

class QuestionServices {
  static getQuestions(
     ) async {
    var res = await ServerHelper().getData(
        ApiUrl.fetchQuestions,
        true);
    print(res);
    print(res.statusCode);
    if (res.statusCode == 200) {
      return res.data;
    } else {
      return false;
    }
  }

}
