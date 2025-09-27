class ChangePasswordRequestEntity {
  String newPassword;
  String oldPassword;
  ChangePasswordRequestEntity({
    required this.newPassword,
    required this.oldPassword,
  });
}
