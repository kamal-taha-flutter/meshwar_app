
import 'package:get_it/get_it.dart';
import 'package:hungryapp/features/auth/data/repositories/auth_repo.dart';
import 'package:hungryapp/features/auth/data/services/firebase_auth_service.dart';
import 'package:hungryapp/features/auth/domain/repositories/base_auth_repo.dart';
import 'package:hungryapp/features/auth/domain/usecases/google_login_usecase.dart';
import 'package:hungryapp/features/auth/domain/usecases/register_usecase.dart';
import 'package:hungryapp/features/auth/domain/usecases/signup_usecase.dart';
import 'package:hungryapp/features/auth/presentation/controllers/auth_cubit.dart';

final di = GetIt.instance;
class ServiceLocator{
  void init(){
    di.registerFactory(()=> AuthCubit(di(),di(),di()));
    di.registerLazySingleton(()=>RegisterUsecase(di()));
    di.registerLazySingleton(()=>SignupUsecase(di()));
    di.registerLazySingleton(()=>GoogleLoginUseCase(di()));
    di.registerLazySingleton<BaseAuthRepo>(()=>AuthRepo(firebaseAuthService:di()));
    di.registerLazySingleton<FirebaseAuthService>(()=>FirebaseAuthService());




  }
}