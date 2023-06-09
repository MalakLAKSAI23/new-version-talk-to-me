class user{
  late String email;
  late String password;
  late String token;
  user(this.email,this.password,this.token );

  String getEmail(){
    return email;
  }

  String getPassword(){
    return password;
  }
  String getToken(){
    return token;
  }


}