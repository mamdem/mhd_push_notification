import 'dart:convert';
import 'dart:io';
import 'package:mhd_push_notification/mhd_push_notification.dart';

Future<void> main() async {
  // Charger la clé Firebase depuis une variable d'environnement
  final serviceAccountJson = Platform.environment['GOOGLE_SERVICE_ACCOUNT'];

  if (serviceAccountJson == null) {
    print("❌ Erreur : La clé de service Firebase n'est pas définie !");
    return;
  }

  final Map<String, dynamic> serviceAccount = jsonDecode(serviceAccountJson);

  await NotificationService.sendNotification(
    deviceToken: "DEVICE_TOKEN",
    title: "Nouvelle notification",
    body: "Ceci est un test de push notification",
    tabIndex: 1,
    serviceAccount: serviceAccount,
  );

  print("✅ Notification envoyée !");
}
