import '../../config.dart';
import 'package:flutter/material.dart';

class RegistrationProvider with ChangeNotifier {

  GlobalKey<FormState> registrationKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPassController = TextEditingController();
  TextEditingController addLine1Controller = TextEditingController();
  TextEditingController addLin2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  final FocusNode firstNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode phoneNumberFocus = FocusNode();
  final FocusNode dobFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confPassFocus = FocusNode();
  final FocusNode addLine1Focus = FocusNode();
  final FocusNode addLine2Focus = FocusNode();
  final FocusNode cityFocus = FocusNode();
  final FocusNode stateFocus = FocusNode();
  final FocusNode pincodeFocus = FocusNode();

  bool isNewPassword = true;

//registration click button
  onRegistration(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    if (registrationKey.currentState!.validate()) {
      registration(context);
    }
  }

  //registration
  registration(context) {
    route.pop(context);
    notifyListeners();
    onBack();
  }

  String gender = "Male";

  void setGender(String? newGender) {
    gender = newGender ?? "Male";
    notifyListeners();
  }

  String getGender() {
    return gender;  // Will never return null
  }

  //onBack clear
  onBack() {
    firstNameController.text = "";
    lastNameController.text = "";
    phoneNumberController.text = "";
    emailController.text = "";
    passwordController.text = "";
    addLine1Controller.text = "";
    addLin2Controller.text = "";
    cityController.text = "";
    stateController.text = "";
    pincodeController.text = "";
    notifyListeners();
  }

  //new password see tap
  newPasswordSeenTap() {
    isNewPassword = !isNewPassword;
    notifyListeners();
  }
}
