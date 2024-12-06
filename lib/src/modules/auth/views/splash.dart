import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/src/config/config.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AssetsManager.logoPath,
          colorFilter: ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn),
          width: MediaQuery.of(context).size.height * 0.1,
        ),
      ),
    );
  }
}
