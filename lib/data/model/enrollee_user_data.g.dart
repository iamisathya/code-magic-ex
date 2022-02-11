// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollee_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrolleeUserData _$EnrolleeUserDataFromJson(Map<String, dynamic> json) =>
    EnrolleeUserData(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      firstNameTh: json['firstNameTh'] as String,
      lastNameTh: json['lastNameTh'] as String,
      enrollerId: json['enrollerId'] as String,
      enrollerName: json['enrollerName'] as String,
      sponsorId: json['sponsorId'] as String,
      sponsorName: json['sponsorName'] as String,
      gender: json['gender'] as String,
      maritalStatus: json['maritalStatus'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      mainAddress1: json['mainAddress1'] as String,
      mainAddress2: json['mainAddress2'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      zipCode: json['zipCode'] as String,
      email: json['email'] as String,
      mobileNumber: json['mobileNumber'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      taxId: json['taxId'] as String,
    );

Map<String, dynamic> _$EnrolleeUserDataToJson(EnrolleeUserData instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'firstNameTh': instance.firstNameTh,
      'lastNameTh': instance.lastNameTh,
      'enrollerId': instance.enrollerId,
      'enrollerName': instance.enrollerName,
      'sponsorId': instance.sponsorId,
      'sponsorName': instance.sponsorName,
      'gender': instance.gender,
      'maritalStatus': instance.maritalStatus,
      'dateOfBirth': instance.dateOfBirth,
      'mainAddress1': instance.mainAddress1,
      'mainAddress2': instance.mainAddress2,
      'city': instance.city,
      'country': instance.country,
      'zipCode': instance.zipCode,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'taxId': instance.taxId,
    };
