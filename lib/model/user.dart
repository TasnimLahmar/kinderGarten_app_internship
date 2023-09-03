class User{
  String login;
  String _password;

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  User(this.login, this._password);
}
