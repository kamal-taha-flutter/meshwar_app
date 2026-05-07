import 'package:hungryapp/features/auth/domain/repositories/base_auth_repo.dart';

class RegisterUsecase {
final BaseAuthRepo baseAuthRepo;

  RegisterUsecase(this.baseAuthRepo);

  Future<void> call(String email,String password){
   return baseAuthRepo.signin(email: email, password: password);
  }
}