import 'package:flutter_diablo2_exchange/index.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                        label: "아이디",
                        labelWidth: 120,
                        content: "아이디를 입력해주세요.",
                        onChanged: (value) {
                          print('id:$value');
                        },
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      InputField(
                        label: "패스워드",
                        labelWidth: 120,
                        content: "패스워드를 입력해주세요.",
                        onChanged: (value) {
                          print('password:$value');
                        },
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      InputField(
                        label: "패스워드 확인",
                        labelWidth: 120,
                        content: "패스워드를 입력해주세요.",
                        onChanged: (value) {
                          print('password1:$value');
                        },
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      InputField(
                        label: "패스워드 확인",
                        labelWidth: 120,
                        content: "패스워드를 입력해주세요.",
                        onChanged: (value) {
                          print('password2:$value');
                        },
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      InputField(
                        label: "휴대폰 번호",
                        labelWidth: 120,
                        content: "휴대폰 번호를 입력해주세요.",
                        onChanged: (value) {
                          print('password2:$value');
                        },
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      InputField(
                        label: "배틀태그 아이디",
                        labelWidth: 120,
                        content: "배틀태그 아이디를 입력해주세요.",
                        onChanged: (value) {
                          print('battle tag:$value');
                        },
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      InputField(
                        label: "디아블로 아이디",
                        labelWidth: 120,
                        content: "디아블로 아이디를 입력해주세요.",
                        onChanged: (value) {
                          print('diablo2 id:$value');
                        },
                      ),
                      SizedBox(
                        height: kDefaultPadding * 2,
                      ),
                      SizedBox(
                        width: 400,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.grey[350]!),
                          ),
                          onPressed: () {},
                          child:
                              Text('가입하기'.tr, style: AppTextStyle.white_14_w400),
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
