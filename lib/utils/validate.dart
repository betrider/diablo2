String? customIdValidate(String? value) {
  // if (value!.length == 0) return null;
  if (value!.length < 5) {
    return '아이디를 최소 5자 이상 입력해주세요.';
  } else {
    return null;
  }
}

String? customBattleTagIdValidate(String? value) {
  // if (value!.length == 0) return null;
  if (value!.length < 5) {
    return '아이디를 최소 5자 이상 입력해주세요.';
  } else {
    return null;
  }
}

String? customDialogIdValidate(String? value) {
  // if (value!.length == 0) return null;
  if (value!.length < 2) {
    return '디아블로 아이디를 최소 1자 이상 입력해주세요.';
  } else {
    return null;
  }
}

String? customPasswordValidate(String? value) {
  // if (value!.length == 0) return null;
  if (value!.length < 5) {
    return '비밀번호를 최소 5자 이상 입력해주세요.';
  } else {
    return null;
  }
}
