class User {
  //User data
  String email;
  String password;

  void setUser(
    String email,
    String password,
  ) {
    this.email = email;
    this.password = password;
  }

  Map data() {
    return {
      'email': email ?? '',
      'password': password ?? '',
    };
  }
}
