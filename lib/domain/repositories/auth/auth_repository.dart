import 'package:dartz/dartz.dart';
import 'package:dnd_app/data/models/auth/create_user_req.dart';
import 'package:dnd_app/data/models/auth/signing_user_req.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signIn(SigningUserReq signinUserReq);
}
