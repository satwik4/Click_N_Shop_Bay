import 'package:bloc/bloc.dart';
import 'package:click_n_shop/layout/cubit/_cubit.dart';
import 'package:click_n_shop/layout/shop_layout.dart';
import 'package:click_n_shop/modules/login/shop_login_screen.dart';
import 'package:click_n_shop/modules/on_boarding/on_boarding_screen.dart';
import 'package:click_n_shop/shared/bloc_observer.dart';
import 'package:click_n_shop/shared/components/constants.dart';
import 'package:click_n_shop/shared/network/local/cache_helper.dart';
import 'package:click_n_shop/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  late Widget widget;
  if (onBoarding != null) {
    if (token != null) {
      widget = const ShopLayout();
    } else {
      widget = ShopLoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({
    required this.startWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
        BlocProvider(
          create: (BuildContext context) => ShopCubit()
            ..getHomeData()
            ..getCategories()
            ..getFavorites()
            ..getUserData(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: startWidget,
          ),
    );
  }
}
