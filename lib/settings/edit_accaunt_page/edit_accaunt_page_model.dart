import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'edit_accaunt_page_widget.dart' show EditAccauntPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditAccauntPageModel extends FlutterFlowModel<EditAccauntPageWidget> {
  ///  Local state fields for this page.

  bool male = true;

  bool female = false;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;
  String? _nameFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введите имя';
    }

    return null;
  }

  // State field(s) for SecondNameField widget.
  FocusNode? secondNameFieldFocusNode;
  TextEditingController? secondNameFieldTextController;
  String? Function(BuildContext, String?)?
      secondNameFieldTextControllerValidator;
  String? _secondNameFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введите фамилию';
    }

    return null;
  }

  // State field(s) for SexField widget.
  FocusNode? sexFieldFocusNode1;
  TextEditingController? sexFieldTextController1;
  String? Function(BuildContext, String?)? sexFieldTextController1Validator;
  String? _sexFieldTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введите пол';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // State field(s) for CountryField widget.
  FocusNode? countryFieldFocusNode;
  TextEditingController? countryFieldTextController;
  String? Function(BuildContext, String?)? countryFieldTextControllerValidator;
  String? _countryFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введите страну';
    }

    return null;
  }

  // State field(s) for NumberField widget.
  FocusNode? numberFieldFocusNode;
  TextEditingController? numberFieldTextController;
  String? Function(BuildContext, String?)? numberFieldTextControllerValidator;
  String? _numberFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введите номер телефона';
    }

    return null;
  }

  // State field(s) for NameFieldGid widget.
  FocusNode? nameFieldGidFocusNode;
  TextEditingController? nameFieldGidTextController;
  String? Function(BuildContext, String?)? nameFieldGidTextControllerValidator;
  String? _nameFieldGidTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введите имя';
    }

    return null;
  }

  // State field(s) for SecondNameFieldGid widget.
  FocusNode? secondNameFieldGidFocusNode;
  TextEditingController? secondNameFieldGidTextController;
  String? Function(BuildContext, String?)?
      secondNameFieldGidTextControllerValidator;
  String? _secondNameFieldGidTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введите фамилию';
    }

    return null;
  }

  // State field(s) for SexField widget.
  FocusNode? sexFieldFocusNode2;
  TextEditingController? sexFieldTextController2;
  String? Function(BuildContext, String?)? sexFieldTextController2Validator;
  String? _sexFieldTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введите пол';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue4;
  FormFieldController<String>? dropDownValueController4;
  // State field(s) for DropDown widget.
  String? dropDownValue5;
  FormFieldController<String>? dropDownValueController5;
  // State field(s) for DropDown widget.
  String? dropDownValue6;
  FormFieldController<String>? dropDownValueController6;
  // State field(s) for CountryFieldGid widget.
  FocusNode? countryFieldGidFocusNode;
  TextEditingController? countryFieldGidTextController;
  String? Function(BuildContext, String?)?
      countryFieldGidTextControllerValidator;
  String? _countryFieldGidTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введите страну';
    }

    return null;
  }

  // State field(s) for NumberFieldGid widget.
  FocusNode? numberFieldGidFocusNode;
  TextEditingController? numberFieldGidTextController;
  String? Function(BuildContext, String?)?
      numberFieldGidTextControllerValidator;
  String? _numberFieldGidTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Введите номер телефона';
    }

    return null;
  }

  // State field(s) for AboutField widget.
  FocusNode? aboutFieldFocusNode;
  TextEditingController? aboutFieldTextController;
  String? Function(BuildContext, String?)? aboutFieldTextControllerValidator;
  String? _aboutFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'О себе is required';
    }

    return null;
  }

  // State field(s) for ExpirienceField widget.
  FocusNode? expirienceFieldFocusNode;
  TextEditingController? expirienceFieldTextController;
  String? Function(BuildContext, String?)?
      expirienceFieldTextControllerValidator;
  String? _expirienceFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Релевантный опыт (например: >10лет) is required';
    }

    return null;
  }

  // State field(s) for CertificateField widget.
  FocusNode? certificateFieldFocusNode;
  TextEditingController? certificateFieldTextController;
  String? Function(BuildContext, String?)?
      certificateFieldTextControllerValidator;
  // State field(s) for LanguagesField widget.
  FocusNode? languagesFieldFocusNode;
  TextEditingController? languagesFieldTextController;
  String? Function(BuildContext, String?)?
      languagesFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    nameFieldTextControllerValidator = _nameFieldTextControllerValidator;
    secondNameFieldTextControllerValidator =
        _secondNameFieldTextControllerValidator;
    sexFieldTextController1Validator = _sexFieldTextController1Validator;
    countryFieldTextControllerValidator = _countryFieldTextControllerValidator;
    numberFieldTextControllerValidator = _numberFieldTextControllerValidator;
    nameFieldGidTextControllerValidator = _nameFieldGidTextControllerValidator;
    secondNameFieldGidTextControllerValidator =
        _secondNameFieldGidTextControllerValidator;
    sexFieldTextController2Validator = _sexFieldTextController2Validator;
    countryFieldGidTextControllerValidator =
        _countryFieldGidTextControllerValidator;
    numberFieldGidTextControllerValidator =
        _numberFieldGidTextControllerValidator;
    aboutFieldTextControllerValidator = _aboutFieldTextControllerValidator;
    expirienceFieldTextControllerValidator =
        _expirienceFieldTextControllerValidator;
  }

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    secondNameFieldFocusNode?.dispose();
    secondNameFieldTextController?.dispose();

    sexFieldFocusNode1?.dispose();
    sexFieldTextController1?.dispose();

    countryFieldFocusNode?.dispose();
    countryFieldTextController?.dispose();

    numberFieldFocusNode?.dispose();
    numberFieldTextController?.dispose();

    nameFieldGidFocusNode?.dispose();
    nameFieldGidTextController?.dispose();

    secondNameFieldGidFocusNode?.dispose();
    secondNameFieldGidTextController?.dispose();

    sexFieldFocusNode2?.dispose();
    sexFieldTextController2?.dispose();

    countryFieldGidFocusNode?.dispose();
    countryFieldGidTextController?.dispose();

    numberFieldGidFocusNode?.dispose();
    numberFieldGidTextController?.dispose();

    aboutFieldFocusNode?.dispose();
    aboutFieldTextController?.dispose();

    expirienceFieldFocusNode?.dispose();
    expirienceFieldTextController?.dispose();

    certificateFieldFocusNode?.dispose();
    certificateFieldTextController?.dispose();

    languagesFieldFocusNode?.dispose();
    languagesFieldTextController?.dispose();
  }
}
