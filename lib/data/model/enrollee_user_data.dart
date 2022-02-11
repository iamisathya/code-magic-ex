import 'package:json_annotation/json_annotation.dart';

part 'enrollee_user_data.g.dart';

@JsonSerializable()
class EnrolleeUserData {
  @JsonKey(name: "firstName")
  String firstName;
  @JsonKey(name: "lastName")
  String lastName;
  @JsonKey(name: 'firstNameTh')
  String firstNameTh;
  @JsonKey(name: 'lastNameTh')
  String lastNameTh;
  @JsonKey(name: 'enrollerId')
  String enrollerId;
  @JsonKey(name: 'enrollerName')
  String enrollerName;
  @JsonKey(name: 'sponsorId')
  String sponsorId;
  @JsonKey(name: 'sponsorName')
  String sponsorName;
  @JsonKey(name: 'gender')
  String gender;
  @JsonKey(name: 'maritalStatus')
  String maritalStatus;
  @JsonKey(name: 'dateOfBirth')
  String dateOfBirth;
  @JsonKey(name: 'mainAddress1')
  String mainAddress1;
  @JsonKey(name: 'mainAddress2')
  String mainAddress2;
  @JsonKey(name: 'city')
  String city;
  @JsonKey(name: 'country')
  String country;
  @JsonKey(name: 'zipCode')
  String zipCode;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'mobileNumber')
  String mobileNumber;
  @JsonKey(name: 'phoneNumber')
  String phoneNumber;
  @JsonKey(name: 'password')
  String password;
  @JsonKey(name: 'taxId')
  String taxId;

  EnrolleeUserData({
    required this.firstName,
    required this.lastName,
    required this.firstNameTh,
    required this.lastNameTh,
    required this.enrollerId,
    required this.enrollerName,
    required this.sponsorId,
    required this.sponsorName,
    required this.gender,
    required this.maritalStatus,
    required this.dateOfBirth,
    required this.mainAddress1,
    required this.mainAddress2,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.email,
    required this.mobileNumber,
    required this.phoneNumber,
    required this.password,
    required this.taxId,
  });

  Map<String, dynamic> toMap() => {
        'firstName': firstName,
        'lastName': lastName,
        'firstNameTh': firstNameTh,
        'lastNameTh': lastNameTh,
        'enrollerId': enrollerId,
        'enrollerName': enrollerName,
        'sponsorId': sponsorId,
        'sponsorName': sponsorName,
        'gender': gender,
        'maritalStatus': maritalStatus,
        'dateOfBirth': dateOfBirth,
        'mainAddress1': mainAddress1,
        'mainAddress2': mainAddress2,
        'city': city,
        'country': country,
        'zipCode': zipCode,
        'email': email,
        'mobileNumber': mobileNumber,
        'phoneNumber': phoneNumber,
        'password': password,
        'taxId': taxId,
      };

  factory EnrolleeUserData.fromJson(Map<String, dynamic> json) =>
      _$EnrolleeUserDataFromJson(json);

  Map<String, dynamic> toJson() => _$EnrolleeUserDataToJson(this);
}
