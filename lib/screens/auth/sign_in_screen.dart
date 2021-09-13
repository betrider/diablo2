import 'package:flutter_diablo2_exchange/index.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  FocusNode focusId = FocusNode();
  FocusNode focusPassword = FocusNode();
  FocusNode focusLogin = FocusNode();

  @override
  void dispose() {
    focusId.dispose();
    focusPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/sign_in_background.jpg'),
              ),
            ),
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [
                SizedBox(
                  height: 650,
                ),
                InputField(
                  autofocus: true,
                  focusNode: focusId,
                  label: "아이디",
                  content: "아이디를 입력해주세요.",
                  onChanged: (value) {
                    print('id:$value');
                  },
                  onFieldSubmitted: (value) {
                    focusId.unfocus();
                    FocusScope.of(context).requestFocus(focusPassword);
                  },
                  validator: customIdValidate,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')), LowerCaseTextFormatter()], //asdf
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                InputField(
                  focusNode: focusPassword,
                  label: "비밀번호",
                  content: "비밀번호를 입력해주세요.",
                  onChanged: (value) {
                    print('password:$value');
                  },
                  onFieldSubmitted: (value) {
                    focusPassword.unfocus();
                    FocusScope.of(context).requestFocus(focusLogin);
                  },
                  obscureText: true,
                  validator: customPasswordValidate,
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                SizedBox(
                  width: 400,
                  height: 48,
                  child: OutlinedButton(
                    focusNode: focusLogin,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey[350]!),
                    ),
                    onPressed: () {
                      //로그인 정보 확인 후 정보 받아오기
                      Get.find<UserController>().signin(
                        loginId2: 'betrider',
                        phoneNumber2: '01055254256',
                        battleTagId2: 'betrider#12345',
                        diabloId2: '베트라이더',
                      );
                      Get.back();
                    },
                    child: Text('로그인'.tr, style: AppTextStyle.white_14_w400),
                  ),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 200,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey[350]!),
                        ),
                        onPressed: () {
                          Get.toNamed('sign_up');
                        },
                        child: Text(
                          '계정 찾기'.tr,
                          style: AppTextStyle.white_14_w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey[350]!),
                        ),
                        onPressed: () {
                          Get.toNamed('sign_up');
                        },
                        child: Text('새로운 계정 만들기'.tr,
                            style: AppTextStyle.white_14_w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
