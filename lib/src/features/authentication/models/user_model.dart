// model creation for firebase


import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String email;
  final String password;
  final String fullName;
  final String phoneNo;

  const UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNo,
  });

  // firestore Map the data in Json formate to store in firebse
  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
    };
  }

  //data fetch
  // Step 1- map user fetched from firebase to usermodel
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id:document.id,
        email: data["Email"], 
        password: data["Password"] , 
        fullName: data["FullName"], 
        phoneNo: data["Phone"],
      );
  }
}
