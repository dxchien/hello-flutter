import 'package:flutter/material.dart';
import 'package:flutter_app/widget/app_text_field.dart';
import 'package:flutter_app/widget/button.dart';
import 'package:flutter_app/widget/dialog/dialog_manager.dart';

void showGifDialog({
  required BuildContext context,
  String? title,
  required String message,
  required Function(String) onConfirm,
  Function? onCancel,
}) {
  DialogManager.show(
    context: context,
    builder: (context) {
      return _Dialog(
        title: title,
        message: message,
        onConfirm: onConfirm,
        onCancel: onCancel,
      );
    },
  );
}

class _Dialog extends StatelessWidget {
  final String? title;
  final String message;
  final Function onConfirm;
  final Function? onCancel;

  const _Dialog(
      {Key? key,
      this.title,
      required this.message,
      required this.onConfirm,
      this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title ?? 'VinID',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 12),
            appTextField(
              controller: controller,
              keyboardType: TextInputType.emailAddress,
              hintText: "0912345678",
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: VinButton(
                    onPressed: () {
                      if (onCancel != null) {
                        onCancel!();
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    text: 'Huỷ',
                    otherStyle: true,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: VinButton(
                    onPressed: () {
                      onConfirm(controller.text);
                    },
                    text: 'Đồng ý',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
