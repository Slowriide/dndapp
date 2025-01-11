import 'package:dartz/dartz.dart';
import 'package:dnd_app/core/usecase/usecase.dart';
import 'package:dnd_app/data/models/auth/create_user_req.dart';
import 'package:dnd_app/domain/repositories/auth/auth_repository.dart';
import 'package:dnd_app/service_locator.dart';

class SignupUseCase implements Usecase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signup(params!);
  }
}
