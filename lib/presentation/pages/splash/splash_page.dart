import 'dart:async';

import 'package:e_commerce_app/presentation/routes/route_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

//Todo: 로그인 bloc.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => context.go(RoutePath.home),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Todo: 하드코딩 된 값 변경할 것.
      backgroundColor: Color(0xFF5F0080),
      body: Center(
        child: SvgPicture.asset('assets/svg/main_logo.svg'),
      ),
    );
  }
}
