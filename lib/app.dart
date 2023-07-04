import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_case/router.dart';

import 'cubit/auth_cubit.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return child!;
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Test',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        routerConfig: AppRouter(
          context.read<AuthCubit>(),
        ).router,
        builder: EasyLoading.init(),
      ),
    );
  }
}
