import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';

class CustomMenuButton extends StatefulWidget {
  const CustomMenuButton({
    this.selectedKey,
    required this.itemList,
    required this.onChanged,
  });

  final String? selectedKey;
  final List<String> itemList;
  final void Function(String value) onChanged;

  @override
  _CustomMenuButtonState createState() => _CustomMenuButtonState();
}

class _CustomMenuButtonState extends State<CustomMenuButton> {
  late String selectedKey;

  List<String> keys = [];

  @override
  void initState() {
    super.initState();
    keys.addAll(widget.itemList);
    selectedKey = widget.selectedKey ?? keys[0];
  }

  @override
  Widget build(BuildContext context) {
    return MenuButton<String>(
      child: normalChildButton(),
      items: keys,
      itemBuilder: (String value) => Container(
        height: 25,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
        child: Text(value),
      ),
      toggledChild: Container(
        child: normalChildButton(),
      ),
      onItemSelected: (String value) {
        setState(() {
          selectedKey = value;
        });
        return widget.onChanged(value);
      },
      onMenuButtonToggle: (bool isToggle) {},
    );
  }

  Widget normalChildButton() {
    return SizedBox(
      width: 90,
      height: 25,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(child: Text(selectedKey, overflow: TextOverflow.ellipsis)),
            const SizedBox(
              width: 12,
              height: 17,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
