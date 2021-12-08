import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../connection.dart';

class ConnectionHandler extends GetWidget<ConnectionViewModel> {
  final Widget connectedWidget;
  final Widget? notConnectedWidget;
  final VoidCallback tryAgainAction;

  const ConnectionHandler({
    Key? key,
    required this.connectedWidget,
    required this.tryAgainAction,
    this.notConnectedWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if(controller.isConnected()) {
          tryAgainAction();
        }
        return controller.isConnected()
            ? connectedWidget
            : InkWell(
          onTap: tryAgainAction,
          child: notConnectedWidget ??
              Column(
                children: [
                  Icon(
                    Icons.cloud_off,
                    size: MediaQuery.of(context).size.height / 4,
                  ),
                  const Text('try again'),
                ],
              ),
        );
      },
    );
  }
}
