import 'dart:convert';
import 'package:http/http.dart' as http;
import 'fcm_auth_service.dart';
import 'dart:developer';

class NotificationService {
  static const String _fcmUrl = 'https://fcm.googleapis.com/v1/projects/sengreen/messages:send';

  static Future<void> sendNotification({
    required String deviceToken,
    required String title,
    required String body,
    required int tabIndex,
    required Map<String, dynamic> serviceAccount, // Clé de service Firebase
  }) async {
    final accessServerKey = await FcmAuthService.getServerKeyToken(serviceAccount);

    final Map<String, dynamic> notification = {
      "message": {
        "token": deviceToken,
        "notification": {
          "title": title,
          "body": body,
        },
        "data": {
          "tabIndex": tabIndex.toString(),
        }
      }
    };

    final response = await http.post(
      Uri.parse(_fcmUrl),
      headers: {
        'Authorization': 'Bearer $accessServerKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(notification),
    );

    if (response.statusCode == 200) {
      log('Notification envoyée avec succès : ${response.body}');
    } else {
      log('Erreur lors de l\'envoi de la notification : ${response.body}');
    }
  }
}
