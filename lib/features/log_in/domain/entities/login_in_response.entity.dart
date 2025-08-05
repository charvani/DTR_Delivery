class SignInResponseEntity {
  final String accessToken, firstName, lastName, mobileNumber;
  final dynamic email;
  final bool isVerified;

  // final Map organisation;

  const SignInResponseEntity({
    required this.accessToken,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isVerified,
    required this.mobileNumber,
  });
}
