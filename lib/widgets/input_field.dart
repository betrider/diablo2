import 'package:flutter_diablo2_exchange/index.dart';

class InputField extends StatelessWidget {
  InputField({
    required this.label,
    required this.content,
    required this.onChanged,
    this.labelWidth = 80,
    this.maxWidth = 400,
    this.maxLength = 20,
    this.focusNode,
    this.autofocus = false,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.validator,
    this.controller,
    this.textInputAction,
    this.enabled = true,
    this.suffixIcon,
  });

  final String label;
  final String content;
  final ValueChanged<String> onChanged;
  final double labelWidth;
  final double maxWidth;
  final int maxLength;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool obscureText;
  final void Function(String value)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final bool enabled;
  final Widget? suffixIcon; 

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Row(
        children: <Widget>[
          if (label != '') ...[
            SizedBox(
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
          ],
          Expanded(
            child: TextFormField(
              enabled: enabled,
              textInputAction: textInputAction,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: obscureText,
              autofocus: autofocus,
              focusNode: focusNode,
              onFieldSubmitted: onFieldSubmitted,
              maxLength: maxLength,
              inputFormatters: inputFormatters,
              style: AppTextStyle.white_16_w400_NF,
              controller: controller,
              onChanged: (value) {
                return onChanged(value);
              },
              cursorColor: Colors.grey[600]!,
              validator: validator,
              decoration: InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.all(10.0),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.grey[400]!,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
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
                suffixIcon: suffixIcon
              ),
            ),
          ),
        ],
      ),
    );
  }
}
