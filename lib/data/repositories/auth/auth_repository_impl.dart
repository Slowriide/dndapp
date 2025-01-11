import 'package:dartz/dartz.dart';
import 'package:dnd_app/data/models/auth/create_user_req.dart';
import 'package:dnd_app/data/models/auth/signing_user_req.dart';
import 'package:dnd_app/data/sources/auth/firebase_auth_datasource.dart';
import 'package:dnd_app/domain/repositories/auth/auth_repository.dart';
import 'package:dnd_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SigningUserReq signinUserReq) async {
    return await sl<AuthfirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthfirebaseService>().signup(createUserReq);
  }
}
