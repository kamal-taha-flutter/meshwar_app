
import 'package:hungryapp/features/auth/data/models/user_model.dart';
import 'package:hungryapp/features/auth/data/services/firebase_auth_service.dart';
import 'package:hungryapp/features/auth/domain/repositories/base_auth_repo.dart';

class AuthRepo extends BaseAuthRepo{
  final FirebaseAuthService firebaseAuthService;

  AuthRepo({required this.firebaseAuthService});
  @override
  Future<void> signin({required String email,required String password,}) async{
   return await firebaseAuthService.signin(email,password);
  }
  
  @override
  Future<void> signup({required String email, required String password}) async{
    return await firebaseAuthService.signup(email,password);
  }

  @override
  Future<UserModel> googleLogin() async{
     return await firebaseAuthService.googleLogin();
  }
}