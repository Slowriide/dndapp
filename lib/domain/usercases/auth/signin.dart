import 'package:dartz/dartz.dart';
import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/data/models/auth/signing_user_req.dart';
import 'package:dnd_app/domain/repositories/auth/auth_repository.dart';
import 'package:dnd_app/service_locator.dart';

class SigninUseCase implements Usecase<Either, SigningUserReq> {
  @override
  Future<Either> call({SigningUserReq? params}) async {
    return sl<AuthRepository>().signIn(params!);
  }
}
