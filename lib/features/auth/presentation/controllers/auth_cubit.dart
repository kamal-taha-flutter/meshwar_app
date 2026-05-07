import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungryapp/features/auth/data/models/user_model.dart';
import 'package:hungryapp/features/auth/domain/usecases/google_login_usecase.dart';
import 'package:hungryapp/features/auth/domain/usecases/register_usecase.dart';
import 'package:hungryapp/features/auth/domain/usecases/signup_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final RegisterUsecase registerUsecase;
  final SignupUsecase signupUsecase;
  final GoogleLoginUseCase googleLoginUseCase;

  AuthCubit(this.registerUsecase, this.signupUsecase, this.googleLoginUseCase) : super(AuthInit());

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    try {
      await registerUsecase(email, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signup({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    try {
      await signupUsecase(email, password);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
Future<void> signInWithGoogle() async {
    emit(AuthLoading());

    try {
      final user = await googleLoginUseCase();
      emit(AuthSuccess(user:user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
  
}
