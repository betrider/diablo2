import 'package:flutter_diablo2_exchange/index.dart';

class ChipGroup extends StatefulWidget {
  const ChipGroup({
    Key? key,
    required this.items,
    this.itemsColor,
    this.itemsImagePath,
    required this.onChanged
  }) : super(key: key);

  final List<String> items;
  final List<Color>? itemsColor;
  final List<String>? itemsImagePath;
  final void Function(String value) onChanged;

  @override
  State<StatefulWidget> createState() => _ChipGroupState();
}

class _ChipGroupState extends State<ChipGroup> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      spacing: 8,
      children: widget.items.mapWithIndex(
        (value, index) {
          return ChoiceChip(
            backgroundColor: Colors.grey,
            avatar: widget.itemsImagePath == null
                ? null
                : widget.itemsImagePath![index] == '' ? null : Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Image.asset(
                      widget.itemsImagePath![index],
                    ),
                  ),
            selected: _selectedIndex == index,
            selectedColor: widget.itemsColor == null
                ? Colors.grey[100]
                : widget.itemsColor![index],
            label: Text(
              "$value".tr,
              style: AppTextStyle.black_20_w400,
            ),
            onSelected: (selected) {
              if (selected) {
                setState(() {
                  _selectedIndex = index;
                });
                return widget.onChanged(widget.items[_selectedIndex]);
              }
            },
          );
        },
      ),
    );
  }
}
