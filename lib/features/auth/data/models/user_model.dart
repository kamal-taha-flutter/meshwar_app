import 'package:hungryapp/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.uid, required super.name, required super.email, required super.image});
  

  factory UserModel.fromGoogle(user) {
    return UserModel(
      uid: user.id,
      name: user.displayName ?? '',
      email: user.email,
      image: user.photoUrl ?? '',
    );
  }
}