import 'package:flutter_diablo2_exchange/index.dart';

class InputField extends StatelessWidget {
  InputField({
    required this.label,
    required this.content,
    required this.onChanged,
  });

  final String label;
  final String content;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 80.0,
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
              child: TextField(
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