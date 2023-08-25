import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san3a/layout/cubit/states_layout.dart';
import 'package:san3a/models/login_model.dart';
import 'package:san3a/modules/add_post_screen/add_post_screen.dart';

import 'package:san3a/modules/chat_screen/all_chats/chat_screen.dart';

import 'package:san3a/modules/menu_screen/menu_screen.dart';
import 'package:san3a/modules/notification_screen/notification_screen.dart';
import 'package:san3a/modules/timeline/timeline_user/timeline_user.dart';

import 'package:san3a/modules/timeline/timeline_worker/timeline_worker.dart';
import 'package:san3a/shared/component/constant.dart';
import 'package:san3a/shared/network/local/cache_helper.dart';

class San3aLayoutCubit extends Cubit<San3aLayoutStates> {
  San3aLayoutCubit() : super(San3aInitialState());
  static San3aLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomScreens1 = [
    // OpenPost(),
    TimeLineForWorker(),
    NotificationsScreen(),
    ChatScreen(),
    MenuScreen(),
  ];
  List<Widget> bottomScreens2 = [
    // OpenPost(),
    TimeLineForUser(),
    NotificationsScreen(),
    ChatScreen(),
    MenuScreen(),
  ];

  List<String> nameAppEnglish = ['TimeLine', 'Notifications', 'Chats', 'Setting'];
  List<String> nameAppArabic = ['المنشورات', 'الاشعارات', 'المحادثات', 'الاعدادات'];

  void changeBottom(int index) {
    currentIndex = index;
    emit(San3aChangeBootomNavState());
  }

  bool isDark = false;
  bool isOpen = false;


  void changeMode({bool? fromShared,bool? fromShared1})async {
    if(fromShared!=null && fromShared1!=null){
      isDark = fromShared;
      isOpen = fromShared1;


      emit(AppChangeModeState());
    }
    else{
      isDark = !isDark ;
      isOpen = !isOpen;

      print(isDark);
      print(isOpen);


      emit(AppChangeModeState());
      await CacheHelper.saveData(key: 'isDark', value: isDark).then((value) => null);
      await CacheHelper.saveData(key: 'isOpen', value: isOpen).then((value) => null);

    }
  }

  bool isArabic1 = true;
  void changeLang({bool? fromSharedLang})async {
    if(  fromSharedLang !=null){
      isArabic1 = fromSharedLang;

      emit(AppChangeModeState());
    }
    else{
      isArabic1 = !isArabic1;
      print(isArabic1);
      emit(AppChangeModeState());
      await CacheHelper.saveData(key: 'isArabic', value: isArabic1).then((value) => null);
    }
  }
}
