import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/widgets/common_widgets.dart';

import '../config.dart';

class TextFieldCommon extends StatelessWidget {
  final String hintText;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final Widget? suffixIcon, prefixIcon;
  final Color? fillColor;
  final bool obscureText;
  final double? vertical, radius;
  final InputBorder? border;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final int? maxLength, minLines, maxLines;
  final ValueChanged<String>? onFieldSubmitted;
  final String? counterText;
  final TextStyle? hintStyle;
  final double? width;
  final double? height, textFieldHeight;
  final Color? leftBorderColor;
  final bool readOnly;
  final VoidCallback? onTap;
  final void Function(String)? onChange;

  const TextFieldCommon({
    Key? key,
    required this.hintText,
    this.inputFormatters,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.border,
    this.obscureText = false,
    this.fillColor,
    this.vertical,
    this.keyboardType,
    this.focusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.radius,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.counterText,
    this.hintStyle,
    this.width,
    this.height,
    this.leftBorderColor,
    this.textFieldHeight,
    this.readOnly = false,
    this.onTap,
    this.onChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 50.35,
        //text input container decor
        decoration: CommonWidget().textFieldDecor(radius, context),
      ),
      Expanded(
          child: TextFormField(
              onChanged:onChanged,
              maxLines: maxLines ?? 1,
              style: appCss.dmPoppinsMedium14.textColor(
                appColor(context).appTheme.txtTransparentColor,
              ),
              focusNode: focusNode,
              onFieldSubmitted: onFieldSubmitted,
              obscureText: obscureText,
              keyboardType: keyboardType,
              validator: validator,
              controller: controller,
              minLines: minLines,
              maxLength: maxLength,
              readOnly: readOnly,
              onTap: onTap,
              inputFormatters:inputFormatters,
              //common input decoration
              decoration: CommonWidget().textfieldInputDecoration(
                  counterText,
                  fillColor,
                  context,
                  radius,
                  suffixIcon,
                  prefixIcon,
                  hintStyle,
                  hintText)))
    ]);
  }
}
