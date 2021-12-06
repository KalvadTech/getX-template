import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../connection.dart';
import '/config/assets.dart';
import '/views/custom/custom_text.dart';
import '/config/keys.dart';

class ConnectivityCheckerSplash extends StatefulWidget {
  final String nextRouteName;
  final int delayInSeconds;
  const ConnectivityCheckerSplash({Key? key, this.nextRouteName = '/auth', this.delayInSeconds = 1}) : super(key: key);

  @override
  State<ConnectivityCheckerSplash> createState() => _ConnectivityCheckerSplashState();
}

class _ConnectivityCheckerSplashState extends State<ConnectivityCheckerSplash> {

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConnectionHandler(
              tryAgainAction: _init,
              connectedWidget: SvgPicture.asset(
                logoPath,
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.contain,
              ),
            ),
            const CustomText(appName),
          ],
        ),
      ),
    );
  }

  void _init(){
    ConnectionActions.instance.initSplash(widget.nextRouteName, widget.delayInSeconds);
  }

}
