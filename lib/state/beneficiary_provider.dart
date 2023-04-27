import 'dart:io';

import 'package:flutter/material.dart';

enum BeneficiaryType { business, family, university }

enum BeneficiaryNationality { american, indian }

class BeneficiaryState extends ChangeNotifier {
  String _name = "";
  String _bankName = "";
  String _routingNum = "";
  String _bankAddress = "";
  BeneficiaryType _beneficiaryType = BeneficiaryType.business;
  BeneficiaryNationality _beneficiaryNationality =
      BeneficiaryNationality.american;
  File? _aadhar;
  File? _passport;
  File? _admissionLetter;

  get name => _name;
  get bankName => _bankName;
  get routingNum => _routingNum;
  get bankAddress => _bankAddress;
  get beneficiaryType => _beneficiaryType;
  get beneficiaryNationality => _beneficiaryNationality;
  get aadhar => _aadhar;
  get passport => _passport;
  get admissionLetter => _admissionLetter;

  set name(v) {
    _name = v;
    notifyListeners();
  }

  set bankName(v) {
    _bankName = v;
    notifyListeners();
  }

  set routingNum(v) {
    _routingNum = v;
    notifyListeners();
  }

  set bankAddress(v) {
    _bankAddress = v;
    notifyListeners();
  }

  set beneficiaryType(v) {
    _beneficiaryType = v;
    notifyListeners();
  }

  set beneficiaryNationality(v) {
    _beneficiaryNationality = v;
    notifyListeners();
  }

  set aadhar(v) {
    _aadhar = v;
    notifyListeners();
  }

  set passport(v) {
    _passport = v;
    notifyListeners();
  }

  set admissionLetter(v) {
    _admissionLetter = v;
    notifyListeners();
  }
}
