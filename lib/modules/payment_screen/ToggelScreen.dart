import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/modules/payment_screen/cubit/payment_cubit.dart';
import 'package:san3a/modules/payment_screen/cubit/payment_state.dart';
import 'package:san3a/modules/payment_screen/ref_code.dart';
import 'package:san3a/modules/payment_screen/visaScreen.dart';
import 'package:san3a/shared/component/component.dart';
import 'package:san3a/shared/component/constant.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubitCubit(),
      child: SafeArea(
        child: BlocConsumer<PaymentCubitCubit, PaymentCubitState>(
          listener: (context, state) {
            if (state is getRefCodeRegistrationIdSucessState) {
              showSnackBar(
                context: context,
                text: San3aLayoutCubit.get(context).isArabic1?"تم الحصول على الكود  بنجاح":"Success get ref code ",
                color: Colors.amber.shade400,
              );
              navigateAndFinish(context, const ReferenceScreen());
            }
            if (state is getRefCodeRegistrationIdErrorState) {
              showSnackBar(
                context: context,
                text:San3aLayoutCubit.get(context).isArabic1? "خطأ في الحصول على الكود":"Error get ref code ",
                color: Colors.red,
              );
            }
          },
          builder: (context, state) {
            var cubit = PaymentCubitCubit.get(context);
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.getRefCode();
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15.0),
                            border:
                            Border.all(color: Colors.black87, width: 2.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Image(
                                image: NetworkImage(AppImages.refCodeImage),
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                San3aLayoutCubit.get(context).isArabic1?"الدفع باستخدام الكود ":'Payment with Ref code',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          navigateAndFinish(context, const VisaScreen());
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: Colors.black, width: 2.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:  [
                              Image(
                                image: NetworkImage(AppImages.visaImage),
                              ),
                              Text(
                               San3aLayoutCubit.get(context).isArabic1? "الدفع باستخدام الفيزا":'Payment with visa',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void showSnackBar({
  required BuildContext context,
  required String text,
  required Color color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: color,
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
    ),
  );
}


class AppImages {
  static const String refCodeImage =
      "https://cdn-icons-png.flaticon.com/128/4090/4090458.png";
  static const String visaImage =
      "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}