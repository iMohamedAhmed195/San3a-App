import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/layout/cubit/cubit_layout.dart';
import 'package:san3a/layout/cubit/states_layout.dart';
import 'package:san3a/layout/san3a_layout.dart';
import 'package:san3a/modules/Login_Screen/Cubit/cubit.dart';
import 'package:san3a/modules/Login_Screen/Login_Screen.dart';
import 'package:san3a/modules/Onboarding_Screens/onbording.dart';
import 'package:san3a/modules/Register_Screen/Cubit/cubit.dart';
import 'package:san3a/modules/Splash_Screen/splash_screen.dart';
import 'package:san3a/modules/chat_screen/all_chats/cubit_chat/chat_cubit.dart';
import 'package:san3a/layout/Drawar.dart';
import 'package:san3a/modules/menu_screen/menu_screen.dart';
import 'package:san3a/modules/otp_Screen/OTP_For_Register/OTPscreen1.dart';
import 'package:san3a/modules/payment_screen/Network/dioHelperPayment.dart';
import 'package:san3a/modules/payment_screen/cubit/payment_cubit.dart';
import 'package:san3a/modules/pro_woker/profile_cubit/profile_worker_cubit.dart';
import 'package:san3a/modules/timeline/timeline_user/timeline_user_cubit/time_line_cubit.dart';
import 'package:san3a/modules/timeline/timeline_worker/timeline_cubit/timeLine_cubit.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/cubit/bloc_observer.dart';
import 'package:san3a/shared/network/local/cache_helper.dart';
import 'package:san3a/shared/network/remote/dio_helper.dart';
import 'package:san3a/shared/styles/themes.dart';

import 'modules/payment_screen/ToggelScreen.dart';
import 'modules/payment_screen/visaScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await DioHelperPayment.initDio();
  await CacheHelper.init();

  bool isDark = CacheHelper.getData(key: 'isDark') ?? false;
  bool isOpen = CacheHelper.getData(key: 'isOpen') ?? false;
  bool onBoarding = CacheHelper.getData(key: 'onBoarding')?? false;
  bool isArabic1 = CacheHelper.getData(key: 'isArabic') ?? true;
  token = CacheHelper.getData(key: 'token');
  role = CacheHelper.getData(key: 'role');


  late Widget widget;
  if(onBoarding != null){
    if(token!=null) {
      widget = DrawerScreen();
    }
    else {
      widget =  Login_Screen();
    }
  } else {
    widget = OnboardingScreen();
  }
  // camera =await availableCameras();
  runApp(MyApp(isDark,isOpen,isArabic1, widget));
}

class MyApp extends StatelessWidget {
  const MyApp(this.isDark, this.isOpen,this.isArabic1 ,this.startWidget, {super.key});
  final bool isDark;
  final bool isOpen;
  final bool isArabic1;

  final Widget startWidget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => San3aLayoutCubit()..changeLang(fromSharedLang: isArabic1)
              ..changeMode(fromShared: isDark, fromShared1: isOpen)),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => TimeLineCubit()..GetPosts()),
        BlocProvider(create: (context) => TimeLineUserCubit()..GetDataWorker()),
        BlocProvider(
            create: (context) => ProfileWorkerCubit()..GetProfilePostsWorker()),
        BlocProvider(
            create: (context) => ChatCubit()..GetAllChats()),


      ],
      child: BlocConsumer<San3aLayoutCubit, San3aLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = San3aLayoutCubit.get(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: ToggleScreen(),
          );
        },
      ),
    );
  }
}
