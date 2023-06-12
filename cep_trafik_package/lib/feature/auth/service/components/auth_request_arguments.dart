enum AuthRequestArguments { grantType,userName,password }

extension AuthRequestArgumentsValues on AuthRequestArguments {
  String get value {
    switch (this) {
      case AuthRequestArguments.grantType:
        return 'password';
      case AuthRequestArguments.userName:
        return 'ibbceptrafik';
      case AuthRequestArguments.password:
        return 'fNQz6Z9ywAcH3orT';
  
      default:
        throw Exception('Argument not found');
    }
  }
}