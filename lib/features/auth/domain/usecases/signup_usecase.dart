import 'package:hungryapp/features/auth/domain/repositories/base_auth_repo.dart';

class SignupUsecase {
final BaseAuthRepo baseAuthRepo;

  SignupUsecase(this.baseAuthRepo);

  Future<void> call(String email,String password){
   return baseAuthRepo.signup(email: email, password: password);
  }
}