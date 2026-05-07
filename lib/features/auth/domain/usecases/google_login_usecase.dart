import 'package:hungryapp/features/auth/data/models/user_model.dart';
import 'package:hungryapp/features/auth/domain/repositories/base_auth_repo.dart';

class GoogleLoginUseCase {
  final BaseAuthRepo repo;

  GoogleLoginUseCase(this.repo);

  Future<UserModel> call() {
    return repo.googleLogin();
  }
}