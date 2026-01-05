// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InteractiveStruct extends FFFirebaseStruct {
  InteractiveStruct({
    String? image,
    String? title,
    double? price,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _title = title,
        _price = price,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  static InteractiveStruct fromMap(Map<String, dynamic> data) =>
      InteractiveStruct(
        image: data['image'] as String?,
        title: data['title'] as String?,
        price: castToType<double>(data['price']),
      );

  static InteractiveStruct? maybeFromMap(dynamic data) => data is Map
      ? InteractiveStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'title': _title,
        'price': _price,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
      }.withoutNulls;

  static InteractiveStruct fromSerializableMap(Map<String, dynamic> data) =>
      InteractiveStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'InteractiveStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InteractiveStruct &&
        image == other.image &&
        title == other.title &&
        price == other.price;
  }

  @override
  int get hashCode => const ListEquality().hash([image, title, price]);
}

InteractiveStruct createInteractiveStruct({
  String? image,
  String? title,
  double? price,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InteractiveStruct(
      image: image,
      title: title,
      price: price,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InteractiveStruct? updateInteractiveStruct(
  InteractiveStruct? interactive, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    interactive
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInteractiveStructData(
  Map<String, dynamic> firestoreData,
  InteractiveStruct? interactive,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (interactive == null) {
    return;
  }
  if (interactive.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && interactive.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final interactiveData =
      getInteractiveFirestoreData(interactive, forFieldValue);
  final nestedData =
      interactiveData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = interactive.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInteractiveFirestoreData(
  InteractiveStruct? interactive, [
  bool forFieldValue = false,
]) {
  if (interactive == null) {
    return {};
  }
  final firestoreData = mapToFirestore(interactive.toMap());

  // Add any Firestore field values
  interactive.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInteractiveListFirestoreData(
  List<InteractiveStruct>? interactives,
) =>
    interactives?.map((e) => getInteractiveFirestoreData(e, true)).toList() ??
    [];
