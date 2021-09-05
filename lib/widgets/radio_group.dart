import 'package:flutter_diablo2_exchange/index.dart';

class RadioGroup extends StatefulWidget {
  const RadioGroup({
    Key? key,
    required this.radioMap,
    required this.onChanged,
    this.titleSpacing = 0,
    this.itemSpacing = 16,
    this.isLine = false,
  }) : super(key: key);

  /// 제목
  final Map<String, String> radioMap;

  /// 변경 콜백
  final ValueChanged<String> onChanged;

  /// 타이틀 간격
  final double titleSpacing;

  /// 라디오간 간격
  final double itemSpacing;

  /// 라인추가 여부
  final bool isLine;

  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  late String groupValue;

  @override
  void initState() {
    super.initState();
    groupValue = widget.radioMap.entries.toList()[0].key;
  }

  @override
  Widget build(BuildContext context) {
    return getWidgets(widget.radioMap);
  }

  Widget getWidgets(Map<String, String> strings) {
    List<Widget> copyList = [];
    strings.forEach((key, mapValue) {
      copyList.add(
        Row(
          children: [
            Theme(
              data: ThemeData(
                unselectedWidgetColor: Colors.white,
              ),
              child: Radio<String>(
                activeColor: kPrimaryColor,
                value: key,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                  return widget.onChanged(value!);
                },
              ),
            ),
            SizedBox(
              width: widget.titleSpacing,
            ),
            InkWell(
              onTap: () {
                setState(() {
                    groupValue = key;
                  });
              },
              child: Text(
                mapValue,
                style: AppTextStyle.white_14_w400,
              ),
            )
          ],
        ),
      );
    });
    return SeparatedRow(
      children: copyList,
      separatorBuilder: (context, index) {
        return SizedBox(
          width: widget.itemSpacing,
        );
      },
    );
  }
}
