import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _NavHome = true;
  bool get NavHome => _NavHome;
  set NavHome(bool value) {
    _NavHome = value;
  }

  bool _NavTours = false;
  bool get NavTours => _NavTours;
  set NavTours(bool value) {
    _NavTours = value;
  }

  bool _NavChat = false;
  bool get NavChat => _NavChat;
  set NavChat(bool value) {
    _NavChat = value;
  }

  bool _NavStore = false;
  bool get NavStore => _NavStore;
  set NavStore(bool value) {
    _NavStore = value;
  }

  bool _NavProfile = false;
  bool get NavProfile => _NavProfile;
  set NavProfile(bool value) {
    _NavProfile = value;
  }

  bool _allowNotification = false;
  bool get allowNotification => _allowNotification;
  set allowNotification(bool value) {
    _allowNotification = value;
  }

  String _Email = '';
  String get Email => _Email;
  set Email(String value) {
    _Email = value;
  }

  String _TourImage = '';
  String get TourImage => _TourImage;
  set TourImage(String value) {
    _TourImage = value;
  }

  bool _isLoadImg = false;
  bool get isLoadImg => _isLoadImg;
  set isLoadImg(bool value) {
    _isLoadImg = value;
  }

  bool _isTurist = false;
  bool get isTurist => _isTurist;
  set isTurist(bool value) {
    _isTurist = value;
  }

  bool _isGid = false;
  bool get isGid => _isGid;
  set isGid(bool value) {
    _isGid = value;
  }

  bool _showMenu = false;
  bool get showMenu => _showMenu;
  set showMenu(bool value) {
    _showMenu = value;
  }

  List<DocumentReference> _GalleryPhotoTour = [];
  List<DocumentReference> get GalleryPhotoTour => _GalleryPhotoTour;
  set GalleryPhotoTour(List<DocumentReference> value) {
    _GalleryPhotoTour = value;
  }

  void addToGalleryPhotoTour(DocumentReference value) {
    GalleryPhotoTour.add(value);
  }

  void removeFromGalleryPhotoTour(DocumentReference value) {
    GalleryPhotoTour.remove(value);
  }

  void removeAtIndexFromGalleryPhotoTour(int index) {
    GalleryPhotoTour.removeAt(index);
  }

  void updateGalleryPhotoTourAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    GalleryPhotoTour[index] = updateFn(_GalleryPhotoTour[index]);
  }

  void insertAtIndexInGalleryPhotoTour(int index, DocumentReference value) {
    GalleryPhotoTour.insert(index, value);
  }

  bool _searchIsActive = false;
  bool get searchIsActive => _searchIsActive;
  set searchIsActive(bool value) {
    _searchIsActive = value;
  }

  List<DocumentReference> _TourApplicationsUsers = [];
  List<DocumentReference> get TourApplicationsUsers => _TourApplicationsUsers;
  set TourApplicationsUsers(List<DocumentReference> value) {
    _TourApplicationsUsers = value;
  }

  void addToTourApplicationsUsers(DocumentReference value) {
    TourApplicationsUsers.add(value);
  }

  void removeFromTourApplicationsUsers(DocumentReference value) {
    TourApplicationsUsers.remove(value);
  }

  void removeAtIndexFromTourApplicationsUsers(int index) {
    TourApplicationsUsers.removeAt(index);
  }

  void updateTourApplicationsUsersAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    TourApplicationsUsers[index] = updateFn(_TourApplicationsUsers[index]);
  }

  void insertAtIndexInTourApplicationsUsers(
      int index, DocumentReference value) {
    TourApplicationsUsers.insert(index, value);
  }

  List<DocumentReference> _VebinarApplicationsUsers = [];
  List<DocumentReference> get VebinarApplicationsUsers =>
      _VebinarApplicationsUsers;
  set VebinarApplicationsUsers(List<DocumentReference> value) {
    _VebinarApplicationsUsers = value;
  }

  void addToVebinarApplicationsUsers(DocumentReference value) {
    VebinarApplicationsUsers.add(value);
  }

  void removeFromVebinarApplicationsUsers(DocumentReference value) {
    VebinarApplicationsUsers.remove(value);
  }

  void removeAtIndexFromVebinarApplicationsUsers(int index) {
    VebinarApplicationsUsers.removeAt(index);
  }

  void updateVebinarApplicationsUsersAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    VebinarApplicationsUsers[index] =
        updateFn(_VebinarApplicationsUsers[index]);
  }

  void insertAtIndexInVebinarApplicationsUsers(
      int index, DocumentReference value) {
    VebinarApplicationsUsers.insert(index, value);
  }

  List<DocumentReference> _IventApplicationsUsers = [];
  List<DocumentReference> get IventApplicationsUsers => _IventApplicationsUsers;
  set IventApplicationsUsers(List<DocumentReference> value) {
    _IventApplicationsUsers = value;
  }

  void addToIventApplicationsUsers(DocumentReference value) {
    IventApplicationsUsers.add(value);
  }

  void removeFromIventApplicationsUsers(DocumentReference value) {
    IventApplicationsUsers.remove(value);
  }

  void removeAtIndexFromIventApplicationsUsers(int index) {
    IventApplicationsUsers.removeAt(index);
  }

  void updateIventApplicationsUsersAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    IventApplicationsUsers[index] = updateFn(_IventApplicationsUsers[index]);
  }

  void insertAtIndexInIventApplicationsUsers(
      int index, DocumentReference value) {
    IventApplicationsUsers.insert(index, value);
  }

  DocumentReference? _TourForGid;
  DocumentReference? get TourForGid => _TourForGid;
  set TourForGid(DocumentReference? value) {
    _TourForGid = value;
  }

  DocumentReference? _GidTour;
  DocumentReference? get GidTour => _GidTour;
  set GidTour(DocumentReference? value) {
    _GidTour = value;
  }
}
