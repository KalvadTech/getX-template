import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/src/config/config.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(logoPath, color: Theme.of(context).primaryColor, width: MediaQuery.of(context).size.height * 0.1,),
      ),
    );
  }
}
