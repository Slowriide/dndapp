import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dnd_app/data/models/auth/create_user_req.dart';
import 'package:dnd_app/data/models/auth/signing_user_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthfirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigningUserReq signinUserReq);
}

class AuthfirebaseServiceImpl extends AuthfirebaseService {
  @override
  Future<Either> signin(SigningUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );
      return const Right('Signin was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'User or email not valid';
      } else if (e.code == 'invalid-credential') {
        message = 'User or email not valid';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      FirebaseFirestore.instance.collection('Users').add({
        'name': createUserReq.fullName,
        'email': data.user?.email,
      });
      return const Right('Signup was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password is to week';
      } else if (e.code == 'email-already-in-use') {
        message = 'The email is already in use';
      }

      return Left(message);
    }
  }
}
