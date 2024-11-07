import 'package:flutter/material.dart';
import '../../essentials/config/api_response.dart';
import 'custom_text.dart';

class ApiHandler extends StatelessWidget {
  final ApiResponse apiResponse;
  final Widget onSuccess;
  final Widget? onLoading;
  final Widget? onFail;
  final VoidCallback? tryAgain;

  const ApiHandler({
    Key? key,
    required this.apiResponse,
    required this.onSuccess,
    this.onLoading,
    this.onFail,
    this.tryAgain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch(apiResponse.status){
      case ApiStatus.idle:
        return Container();
      case ApiStatus.loading:
        return _loadingWidget();
      case ApiStatus.success:
        return onSuccess;
      case ApiStatus.fail:
        return onFail ?? _onFailWidget();
    }
  }

  Widget _loadingWidget() {
    return onLoading ?? const Center(child: CircularProgressIndicator());
  }

  Widget _onFailWidget() {
    return Center(
      child: InkWell(
        onTap: tryAgain,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomText(apiResponse.exception.toString()),
        ),
      ),
    );
  }
}
