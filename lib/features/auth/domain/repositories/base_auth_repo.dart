
import 'package:hungryapp/features/auth/data/models/user_model.dart';
abstract class BaseAuthRepo {
  Future<void> signin({required String email, required String password});
  Future<void> signup({required String email, required String password});
  Future< UserModel> googleLogin();

}
