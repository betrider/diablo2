import 'package:flutter_diablo2_exchange/index.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  
  FocusNode focusId = FocusNode();
  FocusNode focusPassword = FocusNode();
  FocusNode focusPasswordCheck = FocusNode();
  FocusNode focusPhoneNumber = FocusNode();
  FocusNode focusBattleTagId = FocusNode();
  FocusNode focusDiablo2Id = FocusNode();
  FocusNode focusLogin = FocusNode();

  @override
  void dispose() {
    focusId.dispose();
    focusPassword.dispose();
    focusPasswordCheck.dispose();
    focusPhoneNumber.dispose();
    focusBattleTagId.dispose();
    focusDiablo2Id.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/sign_up_background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  width: Get.width,
                  // alignment: Alignment.center,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: kDefaultPadding * 2,
                      ),
                      CustomTitle.size30('회원가입'),
                      SizedBox(
                        height: kDefaultPadding * 2,
                      ),
                      InputField(
                        autofocus: true,
                        focusNode: focusId,
                        label: "아이디",
                        labelWidth: 120,
                        content: "아이디를 입력해주세요.",
                        onChanged: (value) {
                          print('id:$value');
                        },
                        onFieldSubmitted: (value) {
                          focusId.unfocus();
                          FocusScope.of(context).requestFocus(focusPassword);
                        },
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      InputField(
                        focusNode: focusPassword,
                        label: "패스워드",
                        labelWidth: 120,
                        content: "패스워드를 입력해주세요.",
                        onChanged: (value) {
                          print('password:$value');
                        },
                        onFieldSubmitted: (value) {
                          focusPassword.unfocus();
                          FocusScope.of(context).requestFocus(focusPasswordCheck);
                        },
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      InputField(
                        focusNode: focusPasswordCheck,
                        label: "패스워드 확인",
                        labelWidth: 120,
                        content: "패스워드를 입력해주세요.",
                        onChanged: (value) {
                          print('password1:$value');
                        },
                        onFieldSubmitted: (value) {
                          focusPasswordCheck.unfocus();
                          FocusScope.of(context).requestFocus(focusPhoneNumber);
                        },
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      InputField(
                        focusNode: focusPhoneNumber,
                        label: "휴대폰 번호",
                        labelWidth: 120,
                        content: "휴대폰 번호를 입력해주세요.",
                        onChanged: (value) {
                          print('password2:$value');
                        },
                        onFieldSubmitted: (value) {
                          focusPhoneNumber.unfocus();
                          FocusScope.of(context).requestFocus(focusBattleTagId);
                        },
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      InputField(
                        focusNode: focusBattleTagId,
                        label: "배틀태그 아이디",
                        labelWidth: 120,
                        content: "배틀태그 아이디를 입력해주세요.",
                        onChanged: (value) {
                          print('battle tag:$value');
                        },
                        onFieldSubmitted: (value) {
                          focusBattleTagId.unfocus();
                          FocusScope.of(context).requestFocus(focusDiablo2Id);
                        },
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      InputField(
                        focusNode: focusDiablo2Id,
                        label: "디아블로 아이디",
                        labelWidth: 120,
                        content: "디아블로 아이디를 입력해주세요.",
                        onChanged: (value) {
                          print('diablo2 id:$value');
                        },
                        onFieldSubmitted: (value) {
                          focusDiablo2Id.unfocus();
                          FocusScope.of(context).requestFocus(focusLogin);
                        },
                      ),
                      SizedBox(
                        height: kDefaultPadding * 2,
                      ),
                      SizedBox(
                        width: 400,
                        child: OutlinedButton(
                          focusNode: focusLogin,
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.grey[350]!),
                          ),
                          onPressed: () async{
                            dynamic result = await showOkCancelDialog(
                              title: '회원가입 하시겠습니까?',
                              okLabel: '네',
                              cancelLabel: '아니요'
                            );
                            print(result);
                          },
                          child: Text('가입하기'.tr,
                              style: AppTextStyle.white_14_w400),
                        ),
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}