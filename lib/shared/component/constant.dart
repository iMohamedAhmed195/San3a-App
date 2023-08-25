

import 'package:san3a/shared/component/component.dart';

import '../../modules/Login_Screen/Login_Screen.dart';
import '../network/local/cache_helper.dart';

void signOut(context) async {
  await CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigateAndFinish(context, Login_Screen());
    }
  });
}

void printFullText(String text) {
  //Copied Method
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

 String?  token;
 String? role;

/*maaaaaaaaaaaaaaaaaanaaaaaaaaaaaaaaaaaaaaaaarrrrrrrrrrrrrr*/
class ApiConst{
  // https://accept.paymob.com/api/auth/tokens
  static const String baseUrl="https://accept.paymob.com/api";
  static const String getAuthToken="/auth/tokens";
  static const String paymentApiKey="ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TnpreE5EZ3pMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuZ25LQ2hROHB2RDhza19tVnRPV2haWkRHQzdiSTVEQkRWWUVoQmNmejlsa2J0Wk0ySjVURmwyTm9aNVhFQ09TdHV3dkktekgzdHdzbjlITHBEOTlQVUE=";
  static const String getOrderId="/ecommerce/orders";
  static const String getPaymentId="/acceptance/payment_keys";
  static const String getRefCode="/acceptance/payments/pay";
  static String visaUrl='$baseUrl/acceptance/iframes/760306?payment_token=$finalToken';
  static String paymentFirstToken="";
  static int payementOrderId=0;
  static String finalToken="";
  static String refCode="";
  static String integrationIdCart='3816731';

}