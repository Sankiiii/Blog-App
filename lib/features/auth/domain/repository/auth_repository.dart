import 'package:blog_app/core/error/failours.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failour, String>> signupWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failour, String>> logininWithEmailPassword({
    required String email,
    required String password,
  });
}
