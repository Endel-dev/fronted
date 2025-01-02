import 'package:flutter/services.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:vibration/vibration.dart';

import '../../../common/assets/index.dart';
import '../../../common/extension/spacing.dart';
import '../../../common/theme/scale.dart';
import '../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';
import 'package:flutter/material.dart';

import '../../../helper/validation.dart';
import '../../../provider/auth_provider/registration_provider.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_layout_text.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/text_field_common.dart';

class TextFieldLayoutRegistration extends StatefulWidget {
  const TextFieldLayoutRegistration({super.key});

  @override
  State<StatefulWidget> createState() {
    return TextFieldLayoutRegistration_state();
  }
}

class TextFieldLayoutRegistration_state
    extends State<TextFieldLayoutRegistration> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(
        builder: (context1, registration, child) {
      return Stack(
        children: [
          Column(
            children: [
              //text layout
              CommonTextLayout(
                  text: language(context, "First Name"), isStyle: true),
              const VSpace(Sizes.s6),
              //text filed
              TextFieldCommon(
                focusNode: registration.firstNameFocus,
                controller: registration.firstNameController,
                keyboardType: TextInputType.text,
                hintText: language(context, "Enter your first name"),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  // Allow only letters, no numbers or symbols
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    registration.firstNameFocus.requestFocus();
                    Vibration.vibrate();
                    return "First name is required";
                  } else if (value.trim().isEmpty) {
                    return "First name cannot be empty or just spaces";
                  }
                  return null;
                },
              ),

              const VSpace(Sizes.s15),
              //text layout
              CommonTextLayout(
                  text: language(context, "Last Name"), isStyle: true),
              const VSpace(Sizes.s6),
              //text filed
              TextFieldCommon(
                keyboardType: TextInputType.text,
                focusNode: registration.lastNameFocus,
                controller: registration.lastNameController,
                hintText: language(context, "Enter your last name"),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  // Allow only letters, no numbers or symbols
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    registration.lastNameFocus.requestFocus();
                    Vibration.vibrate();
                    return "Last name is required";
                  } else if (value.trim().isEmpty) {
                    return "Last name cannot be empty or just spaces";
                  }
                  return null;
                },
              ),
              const VSpace(Sizes.s15),
              //text layout
              CommonTextLayout(
                  text: language(context, "Phone Number"), isStyle: true),
              const VSpace(Sizes.s6),
              //text filed
              TextFieldCommon(
                controller: registration.phoneNumberController,
                keyboardType: TextInputType.number,
                focusNode: registration.phoneNumberFocus,
                hintText: language(context, "Enter your phone number"),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  LengthLimitingTextInputFormatter(10)
                  // Allow only numbers
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    registration.lastNameFocus.requestFocus();
                    Vibration.vibrate();
                    return "Phone number is required";
                  } else if (value.trim().isEmpty) {
                    return "Phone number cannot be empty or just spaces";
                  } else if (value.length != 10) {
                    return "Phone number must be exactly 10 digits";
                  }
                  return null;
                },
              ),

              const VSpace(Sizes.s15),

              CommonTextLayout(
                text: language(context, "Date of Birth"),
                isStyle: true,
              ),
              const VSpace(Sizes.s6),

              TextFieldCommon(
                controller: registration.dobController,
                keyboardType: TextInputType.text,
                focusNode: registration.dobFocus,
                hintText: language(context, "Select your Date of Birth"),
                readOnly: true,
                // Makes the field non-editable
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: Theme.of(context).primaryColor,
                            onPrimary: Colors.white,
                            onSurface: Colors.black,
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                    registration.dobController.text = formattedDate;
                  }

                  if (_isUserUnderage(pickedDate!)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "You must be 18 years or older to register.",
                          style: TextStyle(color: Colors.white), // Text color
                        ),
                        backgroundColor: Colors.red, // Background color
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                },
              ),

              const VSpace(Sizes.s15),

              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Gender:',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  ChoiceChip(
                    label: Text('Male'),
                    selected: registration.gender == 'Male',
                    // Check if 'Male' is selected
                    onSelected: (selected) {
                      setState(() {
                        registration.gender =
                            'Male'; // Set selected gender to 'Male'
                      });
                    },
                    selectedColor: Colors.yellow,
                  ),
                  SizedBox(width: 10),
                  ChoiceChip(
                    label: Text('Female'),
                    selected: registration.gender == 'Female',
                    // Check if 'Female' is selected
                    onSelected: (selected) {
                      setState(() {
                        registration.gender =
                            'Female'; // Set selected gender to 'Female'
                      });
                    },
                    selectedColor: Colors.yellow,
                  ),
                ],
              ),

              const VSpace(Sizes.s15),

              CommonTextLayout(text: language(context, "Email"), isStyle: true),
              const VSpace(Sizes.s6),
              //text filed
              TextFieldCommon(
                controller: registration.emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: registration.emailFocus,
                hintText: language(context, "Enter your email address"),
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  // Allow only numbers
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    registration.emailFocus.requestFocus();
                    Vibration.vibrate();
                    return "Email address is required";
                  }

                  RegExp emailRegExp = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (!emailRegExp.hasMatch(value)) {
                    registration.emailFocus.requestFocus();
                    Vibration.vibrate();
                    return "Please enter a valid email address";
                  }

                  return null;
                },
              ),
              const VSpace(Sizes.s15),

              CommonTextLayout(
                  text: language(context, "Password"), isStyle: true),
              const VSpace(Sizes.s6),
              //text filed
              TextFieldCommon(
                controller: registration.passwordController,
                keyboardType: TextInputType.visiblePassword,
                focusNode: registration.passwordFocus,
                hintText: language(context, "Enter your password"),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    registration.passwordFocus.requestFocus();
                    Vibration.vibrate();
                    return "Password is required";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters";
                  } else if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
                    return "Password must contain at least one lowercase letter";
                  } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                    return "Password must contain at least one uppercase letter";
                  } else if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
                    return "Password must contain at least one number";
                  } else if (!RegExp(
                          r'(?=.*[!@#\$%\^&\*\(\)_\+\-=\[\]\{\};:,.<>?\\|])')
                      .hasMatch(value)) {
                    return "Password must contain at least one special character";
                  }
                  return null; // No errors, password is valid
                },
              ),
              const VSpace(Sizes.s15),

              CommonTextLayout(
                  text: language(context, "Confirm Password"), isStyle: true),
              const VSpace(Sizes.s6),
              //text filed
              TextFieldCommon(
                controller: registration.confPassController,
                keyboardType: TextInputType.visiblePassword,
                focusNode: registration.confPassFocus,
                hintText: language(context, "Enter confirm password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    registration.confPassFocus.requestFocus();
                    Vibration.vibrate();
                    return "Confirm password is required";
                  } else if (value != registration.passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null; // No errors, confirm password is valid
                },
              ),
              const VSpace(Sizes.s15),

              CommonTextLayout(
                  text: language(context, "Address Line 1"), isStyle: true),
              const VSpace(Sizes.s6),
              //text filed
              TextFieldCommon(
                controller: registration.addLine1Controller,
                keyboardType: TextInputType.text,
                focusNode: registration.addLine1Focus,
                hintText: language(context, "Enter your address line 1"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    registration.addLine1Focus.requestFocus();
                    Vibration.vibrate();
                    return "Address line 1 is required";
                  }
                  return null; // No errors, confirm password is valid
                },
              ),
              const VSpace(Sizes.s15),

              CommonTextLayout(
                  text: language(context, "Address Line 2"), isStyle: true),
              const VSpace(Sizes.s6),
              //text filed
              TextFieldCommon(
                controller: registration.addLin2Controller,
                keyboardType: TextInputType.text,
                focusNode: registration.addLine2Focus,
                hintText: language(context, "Enter your address line 2"),

                /*validator: (value) => validation.passValidation(context, value)*/
              ),
              const VSpace(Sizes.s15),

              CommonTextLayout(text: language(context, "City"), isStyle: true),
              const VSpace(Sizes.s6),
              //text filed
              TextFieldCommon(
                controller: registration.cityController,
                keyboardType: TextInputType.text,
                focusNode: registration.cityFocus,
                hintText: language(context, "Enter your city"),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    registration.cityFocus.requestFocus();
                    Vibration.vibrate();
                    return "City is required";
                  }
                  return null;
                },
              ),
              const VSpace(Sizes.s15),

              CommonTextLayout(text: language(context, "State"), isStyle: true),
              const VSpace(Sizes.s6),
              //text filed
              TextFieldCommon(
                controller: registration.stateController,
                keyboardType: TextInputType.text,
                focusNode: registration.stateFocus,
                hintText: language(context, "Enter your state"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    registration.stateFocus.requestFocus();
                    Vibration.vibrate();
                    return "State is required";
                  }
                  return null;
                },
              ),
              const VSpace(Sizes.s15),
              CommonTextLayout(
                  text: language(context, "Pincode"), isStyle: true),
              const VSpace(Sizes.s6),
              //text filed
              TextFieldCommon(
                controller: registration.pincodeController,
                keyboardType: TextInputType.number,
                focusNode: registration.pincodeFocus,
                hintText: language(context, "Enter your Pincode"),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6)
                  // Allow only numbers
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    registration.pincodeFocus.requestFocus();
                    Vibration.vibrate();
                    return "Pincode is required";
                  } else if (value.length != 6) {
                    return "Pincode must be 6 digits long"; // Length validation for 6 digits
                  } else if (!RegExp(r'^\d{6}$').hasMatch(value)) {
                    return "Pincode must contain only digits"; // Ensure only digits
                  }
                  return null; // No errors, pincode is valid
                },
              ),
            ],
          ),
        ],
      );
    });
  }

  bool _isUserUnderage(DateTime dob) {
    final today = DateTime.now();
    final age = today.year - dob.year;
    final isBeforeBirthdayThisYear = (today.month < dob.month) ||
        (today.month == dob.month && today.day < dob.day);
    return age < 18 || (age == 18 && isBeforeBirthdayThisYear);
  }
}
