import 'package:mhd_push_notification/mhd_push_notification.dart';

void main() async {
  final Map<String, dynamic> serviceAccount = {
    "type": "service_account",
    "project_id": "sengreen",
    "private_key_id": "secret_key_id",
    "private_key": "-----BEGIN PRIVATE KEY-----\n...",
    "client_email": "firebase-adminsdk-ymiqg@sengreen.iam.gserviceaccount.com",
    "client_id": "client_id",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-ymiqg%40sengreen.iam.gserviceaccount.com",
    "universe_domain": "googleapis.com"
  };

  await NotificationService.sendNotification(
    deviceToken: "DEVICE_TOKEN",
    title: "Nouvelle notification",
    body: "Ceci est un test de push notification",
    tabIndex: 1,
    serviceAccount: serviceAccount,
  );
}
