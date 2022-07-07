import 'package:flutter/material.dart';

class AdminInfo with ChangeNotifier {
  String _email = "";
  String _name = '';
  String _phoneNumber = '';
  String _imagePath = '';

  String get email => _email;
  String get name => _name;
  String get phoneNumber => _phoneNumber;
  String get imagePath => _imagePath;

  void infoUpdate(String em, String na, String pN, String iP) {
    _email = em;
    _name = na;
    _phoneNumber = pN;
    _imagePath = iP;
    print('어드민 정보 쐈다');
    print("_email: $_email");
    print("_name: $_name");
    print("_phoneNumber: $_phoneNumber");
    print("_imagePath: $_imagePath");
    notifyListeners();
  }
}