import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lvit/infrastructure/common/color_constants.dart';

class FlutterToast {
  FToast fToast = FToast();

  Future showToast(
      {required BuildContext context,
        String? msg,
        IconData? icon,
        ToastGravity? toastGravity,
        required bool isError}) async {
    if(msg?.isEmpty ?? false) return;
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorConstants.blackColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(100.0),
        ),
        boxShadow: [
          BoxShadow(
              color: ColorConstants.lighterGray,
              blurRadius: 6,
              offset: const Offset(0, 3))
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(
                icon ??
                    ((isError)
                        ? Icons.error_outline_rounded
                        : Icons.task_alt_rounded),
                color: (isError)
                    ? ColorConstants.primaryColor
                    : ColorConstants.primaryColor),
          ),
          Flexible(
            child: Text(
              msg ?? '',
             style: const TextStyle(
               color: ColorConstants.whiteColor,
             ),
            ),
          )
        ],
      ),
    );
    cancelToast();
    fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 2),
        gravity: toastGravity ?? ToastGravity.BOTTOM);
  }

  cancelToast() {
    fToast.removeCustomToast();
  }
}
