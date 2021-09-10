import 'package:flutter_diablo2_exchange/index.dart';

class InputField extends StatelessWidget {
  InputField({
    required this.label,
    this.labelWidth = 80,
    required this.content,
    required this.onChanged,
    this.focusNode,
    this.autofocus = false,
    this.onFieldSubmitted,
  });

  final String label;
  final double labelWidth;
  final String content;
  final ValueChanged<String> onChanged;
  final FocusNode? focusNode;
  final bool autofocus;
  final void Function(String value)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: labelWidth,
              child: Text(
                "$label",
                textAlign: TextAlign.left,
                style: AppTextStyle.white_16_w400,
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              width: 300,
              color: Colors.black,
              child: TextFormField(
                autofocus: autofocus,
                focusNode: focusNode,
                onFieldSubmitted: onFieldSubmitted,
                style: AppTextStyle.white_16_w400,
                onChanged: onChanged,
                cursorColor: Colors.grey[600]!,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.grey[600]!,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.grey[600]!,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.grey[600]!,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "$content",
                  fillColor: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}