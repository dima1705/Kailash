import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? formatTimeUntilEvent(DateTime? eventDate) {
  if (eventDate == null) {
    return '--d : --h : --m';
  }

  final now = DateTime.now();
  final difference = eventDate.difference(now);

  if (difference.isNegative) {
    return '00д : 00ч : 00м';
  }

  final days = difference.inDays;
  final hours = difference.inHours - days * 24;
  final minutes = difference.inMinutes - days * 24 * 60 - hours * 60;

  return '${days.toString().padLeft(2, '0')}д : ${hours.toString().padLeft(2, '0')}ч : ${minutes.toString().padLeft(2, '0')}м';
}

List<String>? getDaysList() {
  return List<String>.generate(31, (index) => (index + 1).toString());
}

List<String>? getMonthsList() {
  return List<String>.generate(12, (index) => (index + 1).toString());
}

List<String>? getYearsList() {
  final currentYear = DateTime.now().year;
  return List<String>.generate(
      currentYear - 1900 + 1, (index) => (currentYear - index).toString());
}

String? calculateProgress(
  DateTime? startDate,
  DateTime? endDate,
) {
// 1. Проверяем, что обе даты не равны null
  if (startDate == null || endDate == null) {
    return "Даты не указаны";
  }

  // 2. Получаем текущее время
  final now = DateTime.now();

  // 3. Общее время путешествия в миллисекундах
  final totalDuration =
      endDate.millisecondsSinceEpoch - startDate.millisecondsSinceEpoch;

  // 4. Прошедшее время от начала до сейчас
  final elapsedDuration =
      now.millisecondsSinceEpoch - startDate.millisecondsSinceEpoch;

  // 5. Дополнительные проверки на корректность данных
  if (totalDuration <= 0) {
    return "Некорректные даты";
  }

  // 6. Вычисляем процент
  double progress = (elapsedDuration / totalDuration) * 100;

  // 7. Ограничиваем от 0 до 100
  if (progress < 0) progress = 0.0;
  if (progress > 100) progress = 100.0;

  // 8. Возвращаем форматированную строку
  return '${progress.toStringAsFixed(1)}%';
}

double? calculateYesterdayKm(
  DateTime? start,
  DateTime? end,
  String? distStr,
) {
  if (start == null || end == null || distStr == null) return null;

  // Преобразование строки
  double distance;
  try {
    distance = double.parse(distStr.replaceAll(',', '.'));
  } catch (e) {
    return null;
  }

  // Проверка: вчерашний день
  final yesterday = DateTime.now().subtract(Duration(days: 1));
  final yesterdayStart =
      DateTime(yesterday.year, yesterday.month, yesterday.day);

  if (yesterdayStart.isBefore(start) || yesterdayStart.isAfter(end)) {
    return null; // Вчера не был днём тура
  }

  // Расчет
  final days = end.difference(start).inDays;
  if (days <= 0) return null;

  return distance / days;
}

double? getExactCompletedDistanceKm(
  DateTime? tourStartDate,
  DateTime? tourEndDate,
  String? totalDistanceString,
) {
  if (tourStartDate == null ||
      tourEndDate == null ||
      totalDistanceString == null) {
    return null;
  }

  double totalDistanceKm;
  try {
    totalDistanceKm = double.parse(totalDistanceString.replaceAll(',', '.'));
  } catch (e) {
    return null;
  }

  final now = DateTime.now();

  // Тур еще не начался
  if (now.isBefore(tourStartDate)) {
    return 0.0;
  }

  // Тур уже завершился
  if (now.isAfter(tourEndDate)) {
    return totalDistanceKm;
  }

  // Расчет прогресса в процентах (по времени)
  final totalMs =
      tourEndDate.millisecondsSinceEpoch - tourStartDate.millisecondsSinceEpoch;
  final passedMs =
      now.millisecondsSinceEpoch - tourStartDate.millisecondsSinceEpoch;

  if (totalMs <= 0) return null;

  final progress = passedMs / totalMs;

  // Дистанция на текущий момент
  final currentDistance = totalDistanceKm * progress;

  return double.parse(currentDistance.toStringAsFixed(1));
}

double? getExactRemainingDistanceKm(
  DateTime? tourStartDate,
  DateTime? tourEndDate,
  String? totalDistanceString,
) {
  if (tourStartDate == null ||
      tourEndDate == null ||
      totalDistanceString == null) {
    return null;
  }

  double totalDistanceKm;
  try {
    totalDistanceKm = double.parse(totalDistanceString.replaceAll(',', '.'));
  } catch (e) {
    return null;
  }

  final now = DateTime.now();

  // Тур еще не начался
  if (now.isBefore(tourStartDate)) {
    return totalDistanceKm;
  }

  // Тур уже завершился
  if (now.isAfter(tourEndDate)) {
    return 0.0;
  }

  // Расчет процента оставшегося пути
  final totalMs =
      tourEndDate.millisecondsSinceEpoch - tourStartDate.millisecondsSinceEpoch;
  final passedMs =
      now.millisecondsSinceEpoch - tourStartDate.millisecondsSinceEpoch;

  if (totalMs <= 0) return null;

  final progress = passedMs / totalMs;
  final remainingProgress = 1.0 - progress;

  // Остаток в км
  final remainingDistance = totalDistanceKm * remainingProgress;

  return double.parse(remainingDistance.toStringAsFixed(1));
}

List<dynamic>? splitName(String? fullName) {
  // функция примает строку с именем и фамилией и должна вернуть список строк, где имя и фамилия
  if (fullName == null || fullName.isEmpty) {
    return null;
  }
  return fullName.split(' ');
}
