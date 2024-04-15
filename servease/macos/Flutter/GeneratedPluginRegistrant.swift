//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import firebase_auth
import firebase_core
<<<<<<< Updated upstream
import geolocator_apple
=======
import google_sign_in_ios
>>>>>>> Stashed changes

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FLTFirebaseAuthPlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseAuthPlugin"))
  FLTFirebaseCorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseCorePlugin"))
<<<<<<< Updated upstream
  GeolocatorPlugin.register(with: registry.registrar(forPlugin: "GeolocatorPlugin"))
=======
  FLTGoogleSignInPlugin.register(with: registry.registrar(forPlugin: "FLTGoogleSignInPlugin"))
>>>>>>> Stashed changes
}
