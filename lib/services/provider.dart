import 'package:flutter/cupertino.dart';

class ProviderTextField with ChangeNotifier{
  bool? isEligible;
  String? eligibilityMessage = "";

  void checkEligibility (int age){
    if ( age >= 18 ){
      isEligible = true;
      eligibilityMessage = "You are availed! ";
      notifyListeners();
    }else{
      isEligible = true;
      eligibilityMessage = "You are  not availed! ";
      notifyListeners();
    }
  }
}