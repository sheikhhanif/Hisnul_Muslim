import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hisnulmuslim/models/prayer_times_model.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:http/http.dart' as http;

class PrayerTimesProvider with ChangeNotifier {
  PrayerTimesProvider() {
    determinePosition();
  }
  bool _loading = true;
  bool get loading => _loading;
  LocationData? _location;
  String? placeTitle;
  String? get getPlaceTitle => this.placeTitle;

  Map<String, dynamic>? _prayers;

  Map<String, dynamic>? get prayers => this._prayers;

  set prayers(value) {
    this._prayers = value;
    notifyListeners();
  }

  set setPlaceTitle(String? placeTitle) => this.placeTitle = placeTitle;

  get location => _location;

  set location(value) {
    _location = value;
    notifyListeners();
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future determinePosition() async {
    try {
      loading = true;

      Location location = new Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          loading = false;
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          loading = false;
          return;
        }
      }

      this.location = await location.getLocation();

      List<Placemark> placemarks = await placemarkFromCoordinates(
          this.location.latitude, this.location.longitude);
      placeTitle = "${placemarks.first.country} / ${placemarks.first.locality}";
      await getPrayerTimes();
      loading = false;
    } catch (e) {
      print(e);
      loading = false;
    }
  }

  Future getPrayerTimes() async {
    final now = DateTime.now();
    final uri = Uri.parse(
        'https://api.aladhan.com/v1/calendar?latitude=${_location?.latitude}&longitude=${_location?.longitude}&method=4&month=${now.month}&year=${now.year}');
    var res = await http.get(uri);
    PrayerTimesModel model = PrayerTimesModel.fromMap(
        json.decode(res.body)['data'][now.day - 1]['timings']);

    

    prayers = {
      'FAJR': model.fajr?.split(' ').first,
      'SUNRISE': model.sunrise?.split(' ').first,
      'DHUHR': model.dhuhr?.split(' ').first,
      'ASR': model.asr?.split(' ').first,
      'MAGHREB': model.maghrib?.split(' ').first,
      'ISHA': model.isha?.split(' ').first,
      'QIYAM': model.midnight?.split(' ').first,
    };
    return;
  }
}
