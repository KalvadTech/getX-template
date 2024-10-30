import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../connection.dart';

/// A widget to handle network connection states and display appropriate UI.
///
/// This widget listens to the connection state via the `ConnectionViewModel`
/// and switches between a connected or not-connected widget accordingly.
///
/// If the device is connected, it displays the `connectedWidget`. If not, it
/// shows the `notConnectedWidget` or a default "try again" UI.
class ConnectionHandler extends GetWidget<ConnectionViewModel> {
  /// The widget to display when the device is connected to the internet.
  final Widget connectedWidget;

  /// The widget to display when the device is not connected.
  /// Defaults to a column with an icon and "try again" text.
  final Widget? notConnectedWidget;

  /// The action to perform when the user taps the retry button.
  final VoidCallback tryAgainAction;

  /// Constructor to create an instance of `ConnectionHandler`.
  const ConnectionHandler({
    super.key,
    required this.connectedWidget,
    required this.tryAgainAction,
    this.notConnectedWidget,
  });

  /// Builds the UI based on the current connection state using an `Obx` widget.
  ///
  /// When the connection is established, the `tryAgainAction` is triggered,
  /// and the `connectedWidget` is displayed. If not connected, the
  /// `notConnectedWidget` or a default UI is shown.
  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        // Trigger the action if the connection is available.
        if (controller.isConnected()) {
          tryAgainAction();
        }

        // Return the appropriate widget based on the connection state.
        return controller.isConnected()
            ? connectedWidget
            : InkWell(
          onTap: tryAgainAction,
          child: notConnectedWidget ??
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_off,
                    size: MediaQuery.of(context).size.height / 4,
                  ),
                  const SizedBox(height: 16.0),
                  const Text('Try again'),
                ],
              ),
        );
      },
    );
  }
}
