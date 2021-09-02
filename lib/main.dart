import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_diablo2_exchange/localization_service.dart';
import 'package:flutter_diablo2_exchange/route.dart';
import 'package:flutter_diablo2_exchange/screens/main/main_screen.dart';
import 'package:flutter_diablo2_exchange/utils/constants/color_constants.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_diablo2_exchange/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //비동기 메소드 사용하기 위해 선언

  await Hive.initFlutter(); //Hive 초기화
  await Hive.openBox('cache'); //Hive cache박스 등록

  await GlobalConfiguration().loadFromAsset("config"); //환경설정 세팅

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      getPages: RouteGenerator.getPages(),
      routingCallback: RouteGenerator.routingCallback,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBgColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kBodyTextColor),
          bodyText2: TextStyle(color: kBodyTextColor),
          headline5: TextStyle(color: kDarkBlackColor),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DropdownSearch Demo")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(4),
            children: <Widget>[
              ///Menu Mode with no searchBox
              DropdownSearch<String>(
                validator: (v) => v == null ? "required field" : null,
                hint: "Select a country",
                mode: Mode.MENU,
                showSelectedItem: true,
                items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                label: "Menu mode *",
                showClearButton: true,
                onChanged: print,
                popupItemDisabled: (String s) => s.startsWith('I'),
                clearButtonSplashRadius: 20,
                selectedItem: "Tunisia",
                onBeforeChange: (a, b) {
                  if (b == null) {
                    AlertDialog alert = AlertDialog(
                      title: Text("Are you sure..."),
                      content: Text("...you want to clear the selection"),
                      actions: [
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                        TextButton(
                          child: Text("NOT OK"),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                      ],
                    );

                    return showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        });
                  }

                  return Future.value(true);
                },
              ),
              Divider(),

              ///Menu Mode with overriden icon and dropdown buttons
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: DropdownSearch<String>(
                      validator: (v) => v == null ? "required field" : null,
                      hint: "Select a country",
                      mode: Mode.MENU,
                      dropdownSearchDecoration: InputDecoration(
                        filled: true,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF01689A)),
                        ),
                      ),
                      showAsSuffixIcons: true,
                      clearButtonBuilder: (_) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(
                          Icons.clear,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      dropdownButtonBuilder: (_) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(
                          Icons.arrow_drop_down,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      showSelectedItem: true,
                      items: [
                        "Brazil",
                        "Italia (Disabled)",
                        "Tunisia",
                        'Canada'
                      ],
                      label: "Menu mode *",
                      showClearButton: true,
                      onChanged: print,
                      popupItemDisabled: (String s) => s.startsWith('I'),
                      selectedItem: "Tunisia",
                    ),
                  ),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Menu mode *",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF01689A)),
                      ),
                    ),
                  ))
                ],
              ),
              Divider(),
              DropdownSearch<UserModel>(
                searchFieldProps: TextFieldProps(
                  controller: TextEditingController(text: 'Mrs'),
                ),
                mode: Mode.BOTTOM_SHEET,
                maxHeight: 700,
                isFilteredOnline: true,
                showClearButton: true,
                showSearchBox: true,
                label: 'User *',
                dropdownSearchDecoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                ),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                validator: (u) => u == null ? "user field is required " : null,
                onFind: (String filter) => getData(filter),
                onChanged: (data) {
                  print(data);
                },
                dropdownBuilder: _customDropDownExample,
                popupItemBuilder: _customPopupItemBuilderExample2,
                popupSafeArea: PopupSafeArea(top: true, bottom: true),
                scrollbarProps: ScrollbarProps(
                  isAlwaysShown: true,
                  thickness: 7,
                ),
              ),
              Divider(),

              ///custom itemBuilder and dropDownBuilder
              DropdownSearch<UserModel>(
                showSearchBox: true,
                searchFieldProps: TextFieldProps(
                  controller: TextEditingController(text: ''),
                ),
                showSelectedItem: true,
                compareFn: (i, s) => i.isEqual(s),
                label: "Person",
                onFind: (String filter) => getData(filter),
                onChanged: (data) {
                  print(data);
                },
                dropdownBuilder: _customDropDownExample,
                popupItemBuilder: _customPopupItemBuilderExample2,
              ),
              Divider(),

              ///BottomSheet Mode with no searchBox
              DropdownSearch<String>(
                mode: Mode.BOTTOM_SHEET,
                items: [
                  "Brazil",
                  "Italia",
                  "Tunisia",
                  'Canada',
                  'Zraoua',
                  'France',
                  'Belgique'
                ],
                label: "Custom BottomShet mode",
                onChanged: print,
                selectedItem: "Brazil",
                showSearchBox: true,
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                    labelText: "Search a country1",
                  ),
                ),
                popupTitle: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Country',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                popupShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
              Divider(),

              ///show favorites on top list
              DropdownSearch<UserModel>(
                showSelectedItem: true,
                showSearchBox: true,
                compareFn: (i, s) => i.isEqual(s),
                label: "Person with favorite option",
                onFind: (filter) => getData(filter),
                onChanged: (data) {
                  print(data);
                },
                dropdownBuilder: _customDropDownExample,
                popupItemBuilder: _customPopupItemBuilderExample2,
                showFavoriteItems: true,
                favoriteItemsAlignment: MainAxisAlignment.start,
                favoriteItems: (items) {
                  return items.where((e) => e.name.contains("Mrs")).toList();
                },
                favoriteItemBuilder: (context, item) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100]),
                    child: Text(
                      "${item.name}",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.indigo),
                    ),
                  );
                },
              ),
              Divider(),

              ///merge online and offline data in the same list and set custom max Height
              DropdownSearch<UserModel>(
                items: [
                  UserModel(name: "Offline name1", id: "999"),
                  UserModel(name: "Offline name2", id: "0101")
                ],
                maxHeight: 300,
                onFind: (String filter) => getData(filter),
                label: "choose a user",
                onChanged: print,
                showSearchBox: true,
              ),
              Divider(),

              ///open dropdown programmatically
              DropdownSearch<String>(
                items: ["no action", "confirm in the next dropdown"],
                label: "open another dropdown programmatically",
                onChanged: (v) {
                  if (v == "confirm in the next dropdown") {
                    _openDropDownProgKey.currentState?.openDropDownSearch();
                  }
                },
              ),
              Padding(padding: EdgeInsets.all(4)),
              DropdownSearch<String>(
                key: _openDropDownProgKey,
                items: ["Yes", "No"],
                label: "confirm",
                showSelectedItem: true,
                dropdownButtonSplashRadius: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _openDropDownProgKey.currentState?.openDropDownSearch();
                      },
                      child: Text("Open dropdownSearch")),
                  ElevatedButton(
                      onPressed: () {
                        _openDropDownProgKey.currentState
                            ?.changeSelectedItem("No");
                      },
                      child: Text("set to 'NO'")),
                  Material(
                    child: ElevatedButton(
                        onPressed: () {
                          _openDropDownProgKey.currentState
                              ?.changeSelectedItem("Yes");
                        },
                        child: Text("set to 'YES'")),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _openDropDownProgKey.currentState
                            ?.changeSelectedItem("Blabla");
                      },
                      child: Text("set to 'Blabla'")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _customDropDownExample(
      BuildContext context, UserModel? item, String itemDesignation) {
    if (item == null) {
      return Container();
    }

    return Container(
      child: (item.avatar == null)
          ? ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(),
              title: Text("No item selected"),
            )
          : ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                  // this does not work - throws 404 error
                  // backgroundImage: NetworkImage(item.avatar ?? ''),
                  ),
              title: Text(item.name),
              subtitle: Text(
                item.createdAt.toString(),
              ),
            ),
    );
  }

  Widget _customPopupItemBuilderExample(
      BuildContext context, UserModel item, bool isSelected) {
    return CupertinoAlertDialog(
        title: Text('title'.toString()),
        content: Text('body'.toString()),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SamplePage(),
                ),
              );
            },
          )
        ],
      );
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context, UserModel item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.name),
        subtitle: Text(item.createdAt.toString()),
        leading: CircleAvatar(
            // this does not work - throws 404 error
            // backgroundImage: NetworkImage(item.avatar ?? ''),
            ),
      ),
    );
  }

  Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "https://5d85ccfb1e61af001471bf60.mockapi.io/user",
      queryParameters: {"filter": filter},
    );

    final data = response.data;
    if (data != null) {
      return UserModel.fromJsonList(data);
    }

    return [];
  }
}

class UserModel {
  final String id;
  final DateTime? createdAt;
  final String name;
  final String? avatar;

  UserModel(
      {required this.id, this.createdAt, required this.name, this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      createdAt:
          json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
      name: json["name"],
      avatar: json["avatar"],
    );
  }

  static List<UserModel> fromJsonList(List list) {
    return list.map((item) => UserModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  ///this method will prevent the override of toString
  bool? userFilterByCreationDate(String filter) {
    return this.createdAt?.toString().contains(filter);
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(UserModel? model) {
    return this.id == model?.id;
  }

  @override
  String toString() => name;
}