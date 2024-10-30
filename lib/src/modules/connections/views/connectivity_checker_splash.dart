import 'package:flutter/material.dart';
import '../connection.dart';
import '/src/config/assets.dart';


class ConnectivityCheckerSplash extends StatefulWidget {
  final String nextRouteName;
  final int delayInSeconds;
  const ConnectivityCheckerSplash({super.key, this.nextRouteName = '/auth', this.delayInSeconds = 1});

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
        child: ConnectionHandler(
          tryAgainAction: _init,
          connectedWidget: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Image.asset(
              AssetsManager.logoPath,
              height: MediaQuery.of(context).size.height / 3,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  void _init(){
    ConnectionActions.instance.initSplash(widget.nextRouteName, widget.delayInSeconds);
  }

}
