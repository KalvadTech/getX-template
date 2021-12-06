import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/views/custom/custom_text.dart';
import '../connection.dart';

class ConnectionOverlay extends GetWidget<ConnectionViewModel> {
  final Widget child;
  final Alignment? alignment;
  const ConnectionOverlay({Key? key,required this.child, this.alignment = Alignment.bottomCenter, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Obx((){
          switch(controller.connectionType.value){
            case ConnectivityType.connecting:
              return const InfoItem(label:'Please wait trying to reconnect');
            case ConnectivityType.disconnected:
              return const InfoItem(label: "please turn on wifi or mobile data", trailing: Icon(Icons.cloud_off),);
            case ConnectivityType.noInternet:
              return const InfoItem(label: "look like you have no internet connection", trailing: Icon(Icons.public_off),);
            default:
              return Container();
          }

        })
      ],
    );
  }
}

class InfoItem extends StatelessWidget {
  final String label;
  final Widget? trailing;
  final VoidCallback? onPressed;
  const InfoItem({Key? key, required this.label, this.trailing, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Expanded(child: CustomText(label)),
          trailing ?? const CircularProgressIndicator(),
        ],
      ),
    );
  }
}

