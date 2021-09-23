import 'package:http/http.dart' as http;
import 'package:flutter_diablo2_exchange/index.dart';
import 'package:flutter_diablo2_exchange/screens/ladder/ladder_item_registration_screen.dart';
import 'package:flutter_diablo2_exchange/screens/standard/standard_item_registration_screen.dart';
import 'screens/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RouteGenerator {
  static void routingCallback(Routing? routing) {
    //푸시 이전 호출 , 팝 이후 호출
    print('routing 콜백: ${routing!.route}');
  }

  static List<GetPage<dynamic>> getPages() {
    return [
      GetPage(name: '/sample', page: () => APISamplePage()),
      GetPage(name: '/sample/:uid', page: () => SampleArgumentPage()),

      GetPage(name: '/sign_in', page: () => SignInScreen()), //로그인
      GetPage(name: '/sign_up', page: () => SignUpScreen()), //회원가입
      GetPage(name: '/sign_out', page: () => SignOutScreen()), //로그아웃
      GetPage(
          name: '/standard_item_add',
          page: () => StandardItemRegistrationScreen()), //스탠 아이템 등록
      GetPage(
          name: '/ladder_item_add',
          page: () => LadderItemRegistrationScreen()), //래더 아이템 등록
    ];
  }
}

// Get.to(NextPage()) //새로운 화면으로 이동합니다:
// Get.toNamed('/next'); //새로운 화면으로 이동합니다:
// Get.back() //스낵바, 다이얼로그, bottomsheets 또는 Navigator.pop(context);로 닫아야 하는 어떤것도 닫게 합니다:
// Get.off(NextPage()) //다음 화면으로 이동하면서 이전 화면을 아예 없애버린다. 이전 화면으로 돌아갈 필요가 없을 때 사용한다. (1개)
// Get.offNamed(NextPage()) //다음 화면으로 이동하면서 이전 화면을 아예 없애버린다. 이전 화면으로 돌아갈 필요가 없을 때 사용한다. (1개)
// Get.offAll(NextPage()) //다음 화면으로 이동하면서 이전 화면을 아예 없애버린다. 이전 화면으로 돌아갈 필요가 없을 때 사용한다. (모두)
// Get.offAllNamed(NextPage()) //다음 화면으로 이동하면서 이전 화면을 아예 없애버린다. 이전 화면으로 돌아갈 필요가 없을 때 사용한다. (모두)

class SamplePage extends StatelessWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ElevatedButton(
            child: Text("동적 Url"),
            onPressed: () {
              Get.toNamed('/sample/213?name=Giyeon&age=27');
            },
          ),
        ),
      ),
    );
  }
}

class SampleArgumentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${Get.parameters['uid']}'),
            Text('${Get.parameters['name']}'),
            Text('${Get.parameters['age']}'),
          ],
        ),
      ),
    );
  }
}

class SamplePage2 extends StatefulWidget {
  const SamplePage2({Key? key}) : super(key: key);

  @override
  State<SamplePage2> createState() => _SamplePage2State();
}

class _SamplePage2State extends State<SamplePage2> {
  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListItemInfo(
                listItemModel: ListItemModel(
                  boardId: '0001',
                  itemImagePath: imagePath,
                  battleTagId: 'betrider#12345',
                  dateTime: DateTime.now().toFullDateTimeString5(),
                  diabloId: 'BETRIDER',
                  memo: '메모입니다.1\n메모입니다.2\n메모입니다.3',
                ),
              ),
              ElevatedButton(
                child: Text("이미지 가져오기"),
                onPressed: () async {
                  imagePath = await getImagePath();
                  setState(() {});
                  print('imagePath : $imagePath');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class APISamplePage extends StatefulWidget {

  @override
  _APISamplePageState createState() => _APISamplePageState();
}

class _APISamplePageState extends State<APISamplePage> {
late Future<Post> post;

  @override
  void initState() {
    super.initState();
    post = ApiService.fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // 기본적으로 로딩 Spinner를 보여줍니다.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class ImageUploadSample extends StatefulWidget {
  @override
  _ImageUploadSampleState createState() => _ImageUploadSampleState();
}

class _ImageUploadSampleState extends State<ImageUploadSample> {
  XFile? _imageFile;
  final String uploadUrl = 'https://api.imgur.com/3/upload';
  // final String uploadUrl = 'https://httpbin.org/post';
  final ImagePicker _picker = ImagePicker();

  // _postRequest() async {
  //   String url = 'http://example.com/login';

  //   http.Response response = await http.post(
  //     Uri.parse(uploadUrl),
  //     headers: <String, String>{
  //       'Content-Type': 'application/x-www-form-urlencoded',
  //     },
  //     body: <String, String>{
  //       'user_id': 'user_id_value',
  //       'user_pwd': 'user_pwd_value'
  //     },
  //   );
  // }

  Future<String?> uploadImage(XFile? file, filepath, url) async {
    dynamic fileByte = await file!.readAsBytes();

    // Map<String, String> headers = { "Accesstoken": "access_token"};
    var request = http.MultipartRequest('POST', Uri.parse(url));

    // request.headers.addAll(headers); //1번
    // request.headers["Accesstoken"] = 'access_token'; //2번

    // request.files.add(await http.MultipartFile.fromPath('image', filepath));
    request.files.add(http.MultipartFile.fromBytes('picture', fileByte,
        filename: filepath.split("/").last));
    // request.files.add(
    //   http.MultipartFile(
    //     'image',
    //     File(filepath).readAsBytes().asStream(),
    //     File(filepath).lengthSync(),
    //     filename: filepath.split("/").last,
    //   ),
    // );

    //request.fields['key'] = 'value';
    var res = await request.send();
    return res.reasonPhrase;
  }

  Future<void> retriveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _imageFile = response.file;
      });
    } else {
      print('Retrieve error ' + response.exception!.code);
    }
  }

  Widget _previewImage() {
    if (_imageFile != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image.file(File(_imageFile!.path)),
            Image.network(_imageFile!.path),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                var res =
                    await uploadImage(_imageFile, _imageFile!.path, uploadUrl);
                print('result');
                print(res);
              },
              child: const Text('Upload'),
            )
          ],
        ),
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  void _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      print("Image picker error " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('image upload'),
      ),
      body: Center(
          child: FutureBuilder<void>(
        future: retriveLostData(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Text('Picked an image');
            case ConnectionState.done:
              return _previewImage();
            default:
              return const Text('Picked an image');
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: 'Pick Image from gallery',
        child: Icon(Icons.photo_library),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SMSAUthSample extends StatefulWidget {
  const SMSAUthSample({Key? key}) : super(key: key);

  @override
  _SMSAUthSampleState createState() => _SMSAUthSampleState();
}

class _SMSAUthSampleState extends State<SMSAUthSample> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();

  String _message = '';
  String? _verificationId;
  ConfirmationResult? webConfirmationResult;

  Future<void> _verifyWebPhoneNumber() async {
    print(_phoneNumberController.text);
    ConfirmationResult confirmationResult =
        await _auth.signInWithPhoneNumber('+82 01028908758');

    webConfirmationResult = confirmationResult;

    print(webConfirmationResult);
  }

  // // Example code of how to verify phone number
  // Future<void> _verifyPhoneNumber() async {
  //   setState(() {
  //     _message = '';
  //   });

  //   PhoneVerificationCompleted verificationCompleted =
  //       (PhoneAuthCredential phoneAuthCredential) async {
  //     await _auth.signInWithCredential(phoneAuthCredential);
  //     showSnackbar(
  //         subTitle:
  //             'Phone number automatically verified and user signed in: $phoneAuthCredential');
  //   };

  //   PhoneVerificationFailed verificationFailed =
  //       (FirebaseAuthException authException) {
  //     setState(() {
  //       _message =
  //           'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}';
  //     });
  //   };

  //   PhoneCodeSent codeSent =
  //       (String verificationId, int? forceResendingToken) async {
  //     showSnackbar(
  //         subTitle: 'Please check your phone for the verification code.');
  //     _verificationId = verificationId;
  //   };

  //   PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
  //       (String verificationId) {
  //     _verificationId = verificationId;
  //   };

  //   try {
  //     await _auth.verifyPhoneNumber(
  //         phoneNumber: _phoneNumberController.text,
  //         timeout: const Duration(seconds: 5),
  //         verificationCompleted: verificationCompleted,
  //         verificationFailed: verificationFailed,
  //         codeSent: codeSent,
  //         codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  //   } catch (e) {
  //     showSnackbar(subTitle: 'Failed to Verify Phone Number: $e');
  //   }
  // }

  // // Example code of how to sign in with phone.
  // Future<void> _signInWithPhoneNumber() async {
  //   try {
  //     final PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: _verificationId!,
  //       smsCode: _smsController.text,
  //     );
  //     final User user = (await _auth.signInWithCredential(credential)).user!;
  //     showSnackbar(subTitle: 'Successfully signed in UID: ${user.uid}');
  //   } catch (e) {
  //     print(e);
  //     showSnackbar(subTitle: 'Failed to sign in');
  //   }
  // }

  Future<void> _confirmCodeWeb() async {
    print('_smsController.text:${_smsController.text}');
    if (webConfirmationResult != null) {
      try {
        dynamic aa = await webConfirmationResult!.confirm(_smsController.text);
        print('성공:$aa');
      } catch (e) {
        showSnackbar(subTitle: 'Failed to sign in: ${e.toString()}');
      }
    } else {
      showSnackbar(
          subTitle:
              'Please input sms code received after verifying phone number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Test sign in with phone number',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Phone number (+x xxx-xxx-xxxx)',
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Phone number (+x xxx-xxx-xxxx)';
                    }
                    return null;
                  },
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    // icon: Icons.contact_phone,
                    // backgroundColor: Colors.deepOrangeAccent[700],
                    child: Text('Verify Number'),
                    onPressed: _verifyWebPhoneNumber,
                  ),
                ),
                TextField(
                  controller: _smsController,
                  decoration:
                      const InputDecoration(labelText: 'Verification code'),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: _confirmCodeWeb,
                    child: Text('Sign In'),
                  ),
                ),
                Visibility(
                  visible: _message != null,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      _message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController _phoneNumberController = TextEditingController();
//   TextEditingController _otpController = TextEditingController();

//   User? _user;
//   String _status = '';

//   late AuthCredential _phoneAuthCredential;
//   String? _verificationId;
//   int? _code;

//   @override
//   void initState() {
//     super.initState();
//     _getFirebaseUser();
//   }

//   void _handleError(e) {
//     print(e.message);
//     setState(() {
//       _status += e.message + '\n';
//     });
//   }

//   Future<void> _getFirebaseUser() async {
//     this._user = FirebaseAuth.instance.currentUser;
//     setState(() {
//       _status = (_user == null) ? 'Not Logged In\n' : 'Already LoggedIn\n';
//     });
//   }

//   /// phoneAuthentication works this way:
//   ///     AuthCredential is the only thing that is used to authenticate the user
//   ///     OTP is only used to get AuthCrendential after which we need to authenticate with that AuthCredential
//   ///
//   /// 1. User gives the phoneNumber
//   /// 2. Firebase sends OTP if no errors occur
//   /// 3. If the phoneNumber is not in the device running the app
//   ///       We have to first ask the OTP and get `AuthCredential`(`_phoneAuthCredential`)
//   ///       Next we can use that `AuthCredential` to signIn
//   ///    Else if user provided SIM phoneNumber is in the device running the app,
//   ///       We can signIn without the OTP.
//   ///       because the `verificationCompleted` callback gives the `AuthCredential`(`_phoneAuthCredential`) needed to signIn
//   Future<void> _login() async {
//     /// This method is used to login the user
//     /// `AuthCredential`(`_phoneAuthCredential`) is needed for the signIn method
//     /// After the signIn method from `AuthResult` we can get `FirebaserUser`(`_firebaseUser`)
//     try {
//       await FirebaseAuth.instance
//           .signInWithCredential(this._phoneAuthCredential)
//           .then((UserCredential authRes) {
//         _user = authRes.user!;
//         print(_user.toString());
//       }).catchError((e) => _handleError(e));
//       setState(() {
//         _status += 'Signed In\n';
//       });
//     } catch (e) {
//       _handleError(e);
//     }
//   }

//   Future<void> _logout() async {
//     /// Method to Logout the `FirebaseUser` (`_firebaseUser`)
//     try {
//       // signout code
//       await FirebaseAuth.instance.signOut();
//       _user!.delete();
//       setState(() {
//         _status += 'Signed out\n';
//       });
//     } catch (e) {
//       _handleError(e);
//     }
//   }

//   Future<void> _submitPhoneNumber() async {
//     /// NOTE: Either append your phone number country code or add in the code itself
//     /// Since I'm in India we use "+91 " as prefix `phoneNumber`
//     String phoneNumber = "+82 " + _phoneNumberController.text.toString().trim();
//     print(phoneNumber);

//     /// The below functions are the callbacks, separated so as to make code more redable
//     void verificationCompleted(AuthCredential phoneAuthCredential) {
//       print('verificationCompleted');
//       setState(() {
//         _status += 'verificationCompleted\n';
//       });
//       this._phoneAuthCredential = phoneAuthCredential;
//       print(phoneAuthCredential);
//     }

//     void verificationFailed(dynamic error) {
//       print('verificationFailed');
//       _handleError(error);
//     }

//     void codeSent(String verificationId, [int? code]) {
//       print('codeSent');
//       this._verificationId = verificationId;
//       print(verificationId);
//       this._code = code;
//       print(code.toString());
//       setState(() {
//         _status += 'Code Sent\n';
//       });
//     }

//     void codeAutoRetrievalTimeout(String verificationId) {
//       print('codeAutoRetrievalTimeout');
//       setState(() {
//         _status += 'codeAutoRetrievalTimeout\n';
//       });
//       print(verificationId);
//     }

//     await FirebaseAuth.instance.verifyPhoneNumber(
//       /// Make sure to prefix with your country code
//       phoneNumber: phoneNumber,

//       /// `seconds` didn't work. The underlying implementation code only reads in `millisenconds`
//       timeout: Duration(milliseconds: 100000),

//       /// If the SIM (with phoneNumber) is in the current device this function is called.
//       /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
//       /// When this function is called there is no need to enter the OTP, you can click on Login button to sigin directly as the device is now verified
//       verificationCompleted: verificationCompleted,

//       /// Called when the verification is failed
//       verificationFailed: verificationFailed,

//       /// This is called after the OTP is sent. Gives a `verificationId` and `code`
//       codeSent: codeSent,

//       /// After automatic code retrival `tmeout` this function is called
//       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
//     ); // All the callbacks are above
//   }

//   void _submitOTP() {
//     /// get the `smsCode` from the user
//     String smsCode = _otpController.text.toString().trim();

//     print('_verificationId:$_verificationId');
//     print('smsCode:$smsCode');

//     /// when used different phoneNumber other than the current (running) device
//     /// we need to use OTP to get `phoneAuthCredential` which is inturn used to signIn/login
//     this._phoneAuthCredential = PhoneAuthProvider.credential(
//         verificationId: this._verificationId!, smsCode: smsCode);

//     print(_phoneAuthCredential);

//     // _login();
//   }

//   void _reset() {
//     _phoneNumberController.clear();
//     _otpController.clear();
//     setState(() {
//       _status = "";
//     });
//   }

//   void _displayUser() {
//     setState(() {
//       _status += _user.toString() + '\n';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         actions: [
//           GestureDetector(
//             child: Icon(Icons.refresh),
//             onTap: _reset,
//           ),
//         ],
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(16),
//         // mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           SizedBox(height: 24),
//           Row(
//             children: <Widget>[
//               Expanded(
//                 flex: 2,
//                 child: TextField(
//                   controller: _phoneNumberController,
//                   decoration: InputDecoration(
//                     hintText: 'Phone Number',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               Spacer(),
//               Expanded(
//                 flex: 1,
//                 child: MaterialButton(
//                   onPressed: _submitPhoneNumber,
//                   child: Text('Submit'),
//                   color: Theme.of(context).accentColor,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 48),
//           Row(
//             children: <Widget>[
//               Expanded(
//                 flex: 2,
//                 child: TextField(
//                   controller: _otpController,
//                   decoration: InputDecoration(
//                     hintText: 'OTP',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               Spacer(),
//               Expanded(
//                 flex: 1,
//                 child: MaterialButton(
//                   onPressed: _submitOTP,
//                   child: Text('Submit'),
//                   color: Theme.of(context).accentColor,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 48),
//           Text('$_status'),
//           SizedBox(height: 48),
//           MaterialButton(
//             onPressed: _login,
//             child: Text('Login'),
//             color: Theme.of(context).accentColor,
//           ),
//           SizedBox(height: 24),
//           MaterialButton(
//             onPressed: _logout,
//             child: Text('Logout'),
//             color: Theme.of(context).accentColor,
//           ),
//           SizedBox(height: 24),
//           MaterialButton(
//             onPressed: _displayUser,
//             child: Text('FirebaseUser'),
//             color: Theme.of(context).accentColor,
//           )
//         ],
//       ),
//     );
//   }
// }
