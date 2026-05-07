
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hungryapp/features/auth/data/models/user_model.dart';

class FirebaseAuthService {

  final FirebaseAuth auth =FirebaseAuth.instance;

  Future<void> signin(String email,String password) async {
   await auth.createUserWithEmailAndPassword(
     email: email,
     password: password,
   );
 }

 Future<void> signup(String email,String password) async {
   await auth.signInWithEmailAndPassword(
     email: email,
     password: password,
   );
 }

  Future<UserModel> googleLogin() async {
    await GoogleSignIn.instance.initialize();

    final user = await GoogleSignIn.instance.authenticate();

    return UserModel(
      name: user.displayName ?? '',
      email: user.email, 
      uid: user.id,
       image: user.photoUrl ??'',
    );
  }

}