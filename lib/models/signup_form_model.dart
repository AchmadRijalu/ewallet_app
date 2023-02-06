class SignupFormModel {
  final String? name;
  final String? email;
  final String? password;
  final String? pin;
  final String? profilePicture;
  final String? ktp;

  SignupFormModel(
      {this.email,
      this.ktp,
      this.name,
      this.password,
      this.pin,
      this.profilePicture});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'emai': email,
      'password': password,
      'pin': pin,
      'profile_picture': profilePicture,
      'ktp': ktp
    };
  }

  SignupFormModel copyWith(
          {String? pin, String? profilePicture, String? ktp}) =>
      SignupFormModel(
          name: name,
          email: email,
          password: password,
          pin: pin ?? this.pin,
          profilePicture: profilePicture ?? this.profilePicture,
          ktp: ktp ?? this.ktp);
}
