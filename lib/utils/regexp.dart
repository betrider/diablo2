///이메일 형식
const RegExpEMAIL =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

///핸드폰번호 형식 ex:01059889221
const RegExpSMARTPHONE = r'^01[0-9]{8,9}$';

///일반전화번호 형식
const RegExpTEL = r'^0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4])[0-9]{7,8}$';

///생년월일(6자리) ex:19991028
const RegExpBIRTHDAY = r'([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))';

///URL 형식
const RegExpURL =
    r"((http?:www\.)|(http?:\/\/)|(https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{2,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?";

///영문 형식
const RegExpRAB = r'[a-zA-Z]';

///소문자 영문 형식
const RegExpLOWERAB = r'(?=.*[a-z])';

///대문자 영문 형식
const RegExpUPPERAB = r'(?=.*[A-Z])';

///숫자 형식
const RegExpNUMBER = r'(\d+)';

///한글 형식
const RegExpKOREAN = r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣\]';

///특수문자 형식
const RegExpSpecial = r'[!?@#$%^&*():;+-=~{}<>_`"|\[\]\\''\']';

/// Password (Easy) Regex
/// Allowing all character except 'whitespace'
/// Minimum character: 8
const passwordEasy = r'^\S{8,}$';

/// Password (Easy) Regex
/// Allowing all character
/// Minimum character: 8
const passwordEasyAllowedWhitespace = r'^[\S ]{8,}$';

/// Password (Normal) Regex
/// Allowing all character except 'whitespace'
/// Must contains at least: 1 letter & 1 number
/// Minimum character: 8
const passwordNormal1 = r'^(?=.*[A-Za-z])(?=.*\d)\S{8,}$';

/// Password (Normal) Regex
/// Allowing all character
/// Must contains at least: 1 letter & 1 number
/// Minimum character: 8
const passwordNormal1AllowedWhitespace = r'^(?=.*[A-Za-z])(?=.*\d)[\S ]{8,}$';

/// Password (Normal) Regex
/// Allowing LETTER and NUMBER only
/// Must contains at least: 1 letter & 1 number
/// Minimum character: 8
const passwordNormal2 = r'^(?=.*[A-Za-z])(?=.*\d)[a-zA-Z0-9]{8,}$';

/// Password (Normal) Regex
/// Allowing LETTER and NUMBER only
/// Must contains: 1 letter & 1 number
/// Minimum character: 8
const passwordNormal2AllowedWhitespace =
    r'^(?=.*[A-Za-z])(?=.*\d)[a-zA-Z0-9 ]{8,}$';

/// Password (Normal) Regex
/// Allowing all character except 'whitespace'
/// Must contains at least: 1 uppercase letter, 1 lowecase letter & 1 number
/// Minimum character: 8
const passwordNormal3 = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)\S{8,}$';

/// Password (Normal) Regex
/// Allowing all character
/// Must contains at least: 1 uppercase letter, 1 lowecase letter & 1 number
/// Minimum character: 8
const passwordNormal3AllowedWhitespace =
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[\S ]{8,}$';

/// Password (Hard) Regex
/// Allowing all character except 'whitespace'
/// Must contains at least: 1 uppercase letter, 1 lowecase letter, 1 number, & 1 special character (symbol)
/// Minimum character: 8
const passwordHard = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])\S{8,}$';

/// Password (Hard) Regex
/// Allowing all character
/// Must contains at least: 1 uppercase letter, 1 lowecase letter, 1 number, & 1 special character (symbol)
/// Minimum character: 8
const passwordHardAllowedWhitespace =
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[\S ]{8,}$';

// /// Image vector regex
// const vector = r'.(svg)$';

// /// Image regex
// const image = r'.(jpeg|jpg|gif|png|bmp)$';

// /// Audio regex
// const audio = r'.(mp3|wav|wma|amr|ogg)$';

// /// Video regex
// const video = r'.(mp4|avi|wmv|rmvb|mpg|mpeg|3gp)$';

// /// Txt regex
// const txt = r'.txt$';

// /// Document regex
// const doc = r'.(doc|docx)$';

// /// Excel regex
// const excel = r'.(xls|xlsx)$';

// /// PPT regex
// const ppt = r'.(ppt|pptx)$';

// /// Document regex
// const apk = r'.apk$';

// /// PDF regex
// const pdf = r'.pdf$';

// /// HTML regex
// const html = r'.html$';