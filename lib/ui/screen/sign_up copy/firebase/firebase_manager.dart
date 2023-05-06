import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseManager {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> createUser(
      {required String email, required String password}) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      // _firebaseAuth.userChanges();
      return true;
    } catch (e) {
      BotToast.showText(text: e.toString());
    }
    return false;
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final User? user = userCredential.user;
      print(user?.uid);
      return true;
    } catch (e) {
      BotToast.showText(text: e.toString());
    }
    return false;
  }

  // Future<bool> updatePass({required String email, required String password}) async {
  //   try {
  //     final userCredential = await _firebaseAuth.
  //         // .(email: email, password: password);
  //     final User? user = userCredential.user;
  //     print(user?.uid);
  //     return true;
  //   } catch (e) {
  //     BotToast.showText(text: e.toString());
  //   }
  //   return false;
  // }
  Future<void> verifyEmail(String email) async {
    try {
      var acs = ActionCodeSettings(
          // URL you want to redirect back to. The domain (www.example.com) for this
          // URL must be whitelisted in the Firebase Console.
          url: 'https://caculator.page.link',
          // This must be true
          handleCodeInApp: true,
          iOSBundleId: 'com.caculator.mobile',
          androidPackageName: 'com.caculator.mobile',
          // installIfNotAvailable
          androidInstallApp: true,
          // minimumVersion
          androidMinimumVersion: '21');
      var emailAuth = email;
      FirebaseAuth.instance
          .sendSignInLinkToEmail(email: emailAuth, actionCodeSettings: acs)
          .catchError(
              (onError) => print('Error sending email verification $onError'))
          .then((value) => print('Successfully sent email verification'));
    } catch (e) {}
  }
}
