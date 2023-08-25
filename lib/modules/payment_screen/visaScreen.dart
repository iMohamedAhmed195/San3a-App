

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/modules/payment_screen/ref_code.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VisaScreen extends StatefulWidget {
  const VisaScreen({Key? key}) : super(key: key);

  @override
  State<VisaScreen> createState() => _VisaScreenState();
}

class _VisaScreenState extends State<VisaScreen> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [
          IconButton(
            onPressed: () {
              paymentExitApp(context);
            },
            icon: const Icon(
              Icons.exit_to_app,
            ),
          )
        ]),
        body: WebView(
          initialUrl: ApiConst.visaUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onProgress: (int progress) {
            print('WebView is loading (progress : $progress%)');
          },
          javascriptChannels: <JavascriptChannel>{
            _toasterJavascriptChannel(context),
          },
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://www.google.com/')) {
              print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          gestureNavigationEnabled: true,
          backgroundColor: const Color(0x00000000),
        ),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      },
    );
  }

  // to exit from app
  void paymentExitApp(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title:  Text(
            San3aLayoutCubit.get(context).isArabic1?"هل أنت متأكد من إكمال الدفع" :'Are you sure completed the pay',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Navigator.pop(context);
                // navigateAndFinish(
                //   context,
                //   RegisterScreen(),
                // );
              },
              child:  Text(San3aLayoutCubit.get(context).isArabic1?"نعم":'Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:  Text(San3aLayoutCubit.get(context).isArabic1?"لا":'No'),
            ),
          ],
        );
      },
    );
  }
}