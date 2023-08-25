import 'package:flutter/material.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/shared/component/constant.dart';

class ReferenceScreen extends StatelessWidget {
  const ReferenceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(San3aLayoutCubit.get(context).isArabic1?"الكود ":'Reference Code'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              paymentExitApp(context);
            },
            icon: const Icon(
              Icons.exit_to_app,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(
                San3aLayoutCubit.get(context).isArabic1?'يجب أن تذهب إلى أي مكان للدفع':'You should go to any market to pay',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
               Text(
                San3aLayoutCubit.get(context).isArabic1?'الكود الخاص بك':'This is reference code',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 30.0),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.purple.shade300,
                ),
                child: Center(
                  child: Text(
                    ApiConst.refCode.isEmpty ? '🚫' : ApiConst.refCode,
                    style: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void paymentExitApp(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title:  Text(
           San3aLayoutCubit.get(context).isArabic1?'هل أنت متأكد من أنك لم تكمل الدفع؟': 'Are you sure not completed the pay',
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
              child:  Text(San3aLayoutCubit.get(context).isArabic1?'نعم':'Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:  Text(San3aLayoutCubit.get(context).isArabic1?'لا':'No'),
            ),
          ],
        );
      },
    );
  }
}


