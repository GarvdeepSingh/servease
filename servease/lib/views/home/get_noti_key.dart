// import 'package:googleapis_auth/auth_io.dart';
// import 'package:http/http.dart';

// class GetServerKey {
//   Future<String> getServerKeyToken() async {
//     final scopes = [
//       'https://www.googleapis.com/auth/userinfo.email',
//       'https://www.googleapis.com/auth/firebase.database',
//       'https://www.googleapis.com/auth/firebase.messaging',
//     ];

//     final client = await clientViaServiceAccount(
//         ServiceAccountCredentials.fromJson(
//           {
//             "type": "service_account",
//             "project_id": "demo1-2060d",
//             "private_key_id": "6c2216698d368689e1e9fc4705410ad92225d265",
//             "private_key":
//                 "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC1Coa9Wa4zlhWY\nWTwmi7JInDqy3mGVPvULWphslGhztaazNMbiZ1yYWY0AvJYB477TfOoWul3gHgCM\ne4tokpdO45lNxumIZW7xRDDsn3fYTNO7U0rkjS5y0YRgUhlvz3SmFgYVKJTgTA33\n/rE3CRd7a6UB2GVGREymQrr3kcpugnjiUJdavF7GTleFwkCf8xPqdH4sAya7fJMI\n1XA5w36wJxrssBBQu+rlG4aadnOa37HYOWW3KcmDbk/GDZ5xvfcBO8bvV+nnHeBs\n3Y50+IbslV6JrOUAG0QwjZF/qkQycDhOdbt3QwXwvfvtt/gzSCqR4l0jC0cUJFPj\nkY1b88GvAgMBAAECggEAFYSWRjw6CdSdZXm5vgUdoCa9jVQEOjZ87qgKdOFg1tvw\n39z2hKNvbIY8TamclMXqgP2YXzIwhTpbq1bl13yQ8mX36zgourb/rDqELCO6HWHo\nSpwYSzkCm9AOUVqAvnrkbPcyKuKja1Nu15qUmquAeIFvX9xGEUd96scErPdNnbu+\nEFnAdexMHkxsYPlmVIK2gh8a6UWQrjVhk0SaYQy9rT6beDh024+YmaRJohAfNaoS\nIO/LvhNqste90s+NZr3y9/VqviL+jXov078HIU1YK+tWT7RbP2g8n7hTGR1b0qki\noUwPUXJahO0a3G5sfVi2XUmi2aNghj3NVLN4Q/HPeQKBgQDXqzyEXFY1cJrIOVmg\nr/ecQZy68kaHZVwSaZYsJM+YkI5FB7tklI7ha5UisAhgeyiXAEKgeiWWErLJpfnv\nw/uxy+WxzfMsXNhTi6XFUatVRPV6qgo8mEcJpeLV9inp39fD1MFi7ZKOAZYz/u8b\nDF3MKLln5MKilNI/sE4j90SBZwKBgQDW5YwJaG3AegP9i/GLtk2g8W/1TI16v7xe\n4akzXXcBYp2HNJKyzOfVwRNBi0to7KJbiaIfFA/LDannKCIBIHIB+FfRWFoebSVI\nlsi09uskkOHCjB7a9Zd18jWCjTdtkHb9NiDYVQ0AFWwdIijIQfCsASSdhKwvP5oA\nRIYcn8GoeQKBgQDMooXBcXu7KSU0ZnZMqargcMEuAUQ6pEpAjj8Xk7YGpOLZTQTZ\n4rvP2CyhxTWtli5lWLHfYwbW5tcNzpbgkaz4fudrVmct6Mq6Ov8Hwv424j+qLD2a\nUULWPLiHHBOY/fPUtMLqA1HTvF2w6Gwn1gwJ83o4wi6L5Xm5RKhgJ/awcQKBgQCg\nM+ZOySwwtoWtChvbVN/QYM1fKF+8p52tejtiUIY8YSEgv3+xjfIzN0m8rjRclzR+\nWz+iPZl8fcYwzolzH5X+g/4r0dr1HdcSo14jEoS/8MZs+3qxLy9nvVZI6i/tHSqn\noCeiPt1/N3kuyt1uVUIvaHa8e0DFxHtxQaRdSHfduQKBgQCEqBZtfE7ayy9Z7Idk\nnnIzjYWn2PQtxGkRmGyl0IexrpZriLBzMFGvmb6Y60QtFby5Fqdu6ODxcV6MTdz2\nxFai9vrZ8up3AmmzMGpREhZ2vQWx8GPObuaQomu/1t+4W5dvbzVYO2cZmJO1VLK3\nYhLojuz5wHaXTGwNVMVPoxlmjA==\n-----END PRIVATE KEY-----\n",
//             "client_email":
//                 "firebase-adminsdk-xjogs@demo1-2060d.iam.gserviceaccount.com",
//             "client_id": "101848706520015414179",
//             "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//             "token_uri": "https://oauth2.googleapis.com/token",
//             "auth_provider_x509_cert_url":
//                 "https://www.googleapis.com/oauth2/v1/certs",
//             "client_x509_cert_url":
//                 "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-xjogs%40demo1-2060d.iam.gserviceaccount.com",
//             "universe_domain": "googleapis.com"
//           },
//         ),
//         scopes);
//     final accessServerKey = client.credentials.accessToken.data;

//     return accessServerKey;
//   }
// }
