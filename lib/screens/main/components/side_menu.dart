import 'package:flutter_diablo2_exchange/index.dart';

class SideMenu extends StatelessWidget {
  final MenuController _controller =
      Get.put(MenuController(getCache.get('pageIndex')));

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kDarkBlackColor,
        child: Obx(
          () => ListView(
            children: [
              DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 3.5),
                  child: Image.asset(
                      'assets/icons/Diablo_II_Resurrected_Logo.png'),
                ),
              ),
              ...List.generate(
                _controller.menuItems.length,
                (index) => DrawerItem(
                  isActive: index == _controller.selectedIndex,
                  title: _controller.menuItems[index],
                  press: () {
                    _controller.setMenuIndex(index);
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback press;

  const DrawerItem({
    Key? key,
    required this.title,
    required this.isActive,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        selected: isActive,
        selectedTileColor: kPrimaryColor,
        onTap: press,
        title: Text(
          title.tr,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
