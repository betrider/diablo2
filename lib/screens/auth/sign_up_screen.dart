import 'package:flutter_diablo2_exchange/index.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController idTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController passwordCheckTextController = TextEditingController();
  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController authenticationTextController = TextEditingController();
  TextEditingController battleTagTextController = TextEditingController();
  TextEditingController diabloIdTextController = TextEditingController();

  ConfirmationResult? webConfirmationResult; //sms 인증번호 결과
  bool showAuthenticationField = false;

  @override
  void dispose() {
    idTextController.dispose();
    passwordTextController.dispose();
    passwordCheckTextController.dispose();
    phoneNumberTextController.dispose();
    battleTagTextController.dispose();
    diabloIdTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Form(
          key: formKey,
          child: Stack(
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
                    padding: EdgeInsets.all(kDefaultPadding),
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
                          label: "아이디",
                          labelWidth: 120,
                          content: "아이디를 입력해주세요.",
                          onChanged: (value) {
                            print('id:$value');
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          validator: customIdValidate,
                          controller: idTextController,
                          inputFormatters: idTextInputFormatter,
                          textInputAction: TextInputAction.next,
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
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          validator: customPasswordValidate,
                          obscureText: true,
                          controller: passwordTextController,
                          textInputAction: TextInputAction.next,
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
                          onFieldSubmitted: (value) {},
                          validator: customPasswordValidate,
                          obscureText: true,
                          controller: passwordCheckTextController,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(
                          height: kDefaultPadding,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InputField(
                              label: "휴대폰 번호",
                              labelWidth: 120,
                              maxWidth: 300,
                              content: "휴대폰 번호를 입력해주세요.",
                              onChanged: (value) {
                                print('password2:$value');
                              },
                              onFieldSubmitted: (value) {},
                              inputFormatters: [PhoneNumberFormatter()],
                              validator: customPhoneNumberValidate,
                              controller: phoneNumberTextController,
                              textInputAction: TextInputAction.done,
                              maxLength: 13,
                            ),
                            SizedBox(
                              width: kDefaultPadding,
                            ),
                            SizedBox(
                              width: 80,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () async {
                                  String? validate = customPhoneNumberValidate(
                                      phoneNumberTextController.text);
                                  if (validate == null) {
                                    await _verifyWebPhoneNumber();
                                    showToast(message: '인증번호가 발송되었습니다.');
                                    setState(() {
                                      showAuthenticationField = true;
                                    });
                                  } else {
                                    showToast(message: validate);
                                  }
                                },
                                child: Text(
                                  '인증번호\n발송'.tr,
                                  style: AppTextStyle.white_12_w400,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                        Visibility(
                            visible: showAuthenticationField,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InputField(
                                      label: "인증번호",
                                      labelWidth: 120,
                                      maxWidth: 300,
                                      content: "인증번호입력",
                                      onChanged: (value) {
                                        print('auth2:$value');
                                      },
                                      onFieldSubmitted: (value) {
                                        print(value);
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      controller: authenticationTextController,
                                      maxLength: 6,
                                      textInputAction: TextInputAction.done,
                                    ),
                                    SizedBox(
                                      width: kDefaultPadding,
                                    ),
                                    SizedBox(
                                      width: 80,
                                      height: 40,
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            String? test = customAuthentication(
                                                authenticationTextController
                                                    .text);
                                            if (test == null) {
                                              await _confirmCodeWeb();
                                            } else {
                                              showToast(message: test);
                                            }
                                          },
                                          child: Text(
                                            '인증번호\n확인'.tr,
                                            style: AppTextStyle.white_12_w400,
                                            textAlign: TextAlign.center,
                                          )),
                                    )
                                  ],
                                ),
                              ],
                            )),
                        SizedBox(
                          height: kDefaultPadding,
                        ),
                        InputField(
                          label: "배틀태그",
                          labelWidth: 120,
                          content: "배틀태그를 입력해주세요.",
                          onChanged: (value) {
                            print('battle tag:$value');
                          },
                          onFieldSubmitted: (value) {},
                          validator: customBattleTagIdValidate,
                          controller: battleTagTextController,
                          textInputAction: TextInputAction.next,
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
                          onFieldSubmitted: (value) {},
                          validator: customDialogIdValidate,
                          controller: diabloIdTextController,
                          textInputAction: TextInputAction.done,
                        ),
                        SizedBox(
                          height: kDefaultPadding * 2,
                        ),
                        SizedBox(
                          width: 400,
                          height: 48,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.grey[350]!),
                            ),
                            onPressed: () async {
                              if (this.formKey.currentState!.validate()) {
                                if (passwordTextController.text !=
                                    passwordCheckTextController.text) {
                                  showToast(message: '비밀번호가 다릅니다.');
                                } else {
                                  // validation 이 성공하면 폼 저장하기
                                  this.formKey.currentState!.save();

                                  bool result = await showOkCancelDialog(
                                    title: '회원가입',
                                    content:
                                        '등록된 정보로 경매가 이루어집니다.\n\n회원가입 하시겠습니까?',
                                  );

                                  if (result) {
                                    if (true) {
                                      //회원가입 성공 시
                                      Get.find<UserController>().signin(
                                        loginId2: idTextController.text,
                                        phoneNumber2:
                                            phoneNumberTextController.text,
                                        battleTagId2:
                                            battleTagTextController.text,
                                        diabloId2: diabloIdTextController.text,
                                      );
                                      Get.back();
                                      Get.back();
                                      showToast(
                                          message: '회원가입이 성공적으로 완료되었습니다.');
                                      // ignore: dead_code
                                    } else {
                                      showToast(message: '회원가입에 실패했습니다.');
                                    }
                                  }
                                }
                              }
                            },
                            child: Text(
                              '가입하기'.tr,
                              style: AppTextStyle.white_14_w400,
                            ),
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
          ),
        ));
  }

  Future<void> _verifyWebPhoneNumber() async {
    ConfirmationResult confirmationResult = await _auth.signInWithPhoneNumber(
        '+82 ${phoneNumberTextController.text.replaceAll('-', '').trim()}');
    webConfirmationResult = confirmationResult;
  }

  Future<void> _confirmCodeWeb() async {
    try {
      dynamic result = await webConfirmationResult!
          .confirm(authenticationTextController.text);
      print('성공:$result');
      showToast(message: '인증에 성공했습니다.');
    } catch (e) {
      showSnackbar(
        title: '오류',
        subTitle: '인증에 실패했습니다 : ${e.toString()}',
      );
    }
  }
}
