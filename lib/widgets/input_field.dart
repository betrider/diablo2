import 'package:flutter_diablo2_exchange/index.dart';

class InputField extends StatelessWidget {
  InputField(
      {required this.label,
      required this.content,
      required this.onChanged,
      this.labelWidth = 80,
      this.maxLength = 20,
      this.focusNode,
      this.autofocus = false,
      this.obscureText = false,
      this.onFieldSubmitted,
      this.inputFormatters,
      this.validator});

  final String label;
  final String content;
  final ValueChanged<String> onChanged;
  final double labelWidth;
  final int maxLength;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool obscureText;
  final void Function(String value)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

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
              color: Colors.transparent,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: obscureText,
                autofocus: autofocus,
                focusNode: focusNode,
                onFieldSubmitted: onFieldSubmitted,
                maxLength: maxLength,
                inputFormatters: inputFormatters,
                style: AppTextStyle.white_16_w400,
                onChanged: (value) {
                  return onChanged(value);
                },
                cursorColor: Colors.grey[600]!,
                validator: validator,
                decoration: InputDecoration(
                  counterText: '',
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
                  hintStyle: AppTextStyle.grey_14_w400,
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
