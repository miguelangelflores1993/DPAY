import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intl/intl.dart';

class NotificationModel extends Equatable {

  NotificationModel({
    String? id,
    this.title,
    this.message,
    String? date,
    this.data,
    this.imageURL,
  }) : 
    id = id?.replaceAll(':', '').replaceAll('%', '') ?? '',
    date = date != null ? _formatDate(date) : '';

  @pragma('vm:entry-point')
  factory NotificationModel.fromRemoteMsg(RemoteMessage message) {
    return NotificationModel(
      id: message.messageId ?? '',
      title: (message.data['title']?.toString() ?? message.notification?.title) ?? '',
      message: (message.data['body']?.toString() ?? message.notification?.body) ?? '',
      date: DateTime.now().toString(),
      imageURL: Platform.isAndroid 
          ? message.notification?.android?.imageUrl ?? '' 
          : message.notification?.apple?.imageUrl ?? '',
      data: message.data,
    );
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
  return NotificationModel(
    id: json['id']?.toString() ?? '',
    title: json['title']?.toString(),
    message: json['message']?.toString(),
    date: json['date']?.toString() ?? '',
    data: json['data'] is Map<String, dynamic> ? json['data'] as Map<String, dynamic> : null,
    imageURL: json['imageURL']?.toString(),
  );
}
  final String? id;
  final String? title;
  final String? message;
  final String? date;
  final Map<String, dynamic>? data;
  final String? imageURL;

  bool get hasNotificationData => data != null && (title?.isEmpty ?? true) || (message?.isEmpty ?? true);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'date': date,
      'imageURL': imageURL,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  static String _formatDate(String date) {
    final dateTime = DateTime.parse(date);
    return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
  }

  @override
  String toString() {
    return '''
      id: $id,
      title: $title,
      message: $message,
      date: $date
    ''';
  }

  @override
  List<Object?> get props => [id, title, message, date];
}
