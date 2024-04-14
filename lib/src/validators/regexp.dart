

enum RegExpType{
  email,
  passwordContainNumber,
  passwordContainLowercase,
  passwordContainUppercase,
  passwordContainSpecialCharacter,
}

final Map<RegExpType,RegExp> AppRegExp = {
  RegExpType.email : RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',),
  RegExpType.passwordContainNumber : RegExp(r'^(?=.*?[0-9])'),
  RegExpType.passwordContainLowercase : RegExp(r'^(?=.*[a-z])'),
  RegExpType.passwordContainUppercase : RegExp(r'^(?=.*[A-Z])'),
  RegExpType.passwordContainSpecialCharacter : RegExp(r'^(?=.*?[!@#\$&*~])'),
};
