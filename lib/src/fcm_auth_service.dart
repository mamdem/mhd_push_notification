import 'package:googleapis_auth/auth_io.dart';

class FcmAuthService {
  static Future<String> getServerKeyToken(Map<String, dynamic> serviceAccount) async {
    final scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];

    final client = await clientViaServiceAccount(
      ServiceAccountCredentials.fromJson(serviceAccount),
      scopes,
    );

    return client.credentials.accessToken.data;
  }
}
