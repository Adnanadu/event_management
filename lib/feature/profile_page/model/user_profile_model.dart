import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {
  factory UserProfileModel({
    required String name,
    required String username,
    required String dateOfBirth,
    required String email,
    required String phoneNumber,
    required String gender,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, String> json) =>
      _$UserProfileModelFromJson(json);
}
