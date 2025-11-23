import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/core/error/failours.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_store.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl  implements AuthRepository {
  final AuthRemoteDataStore remoteDataStore;
  AuthRepositoryImpl(this.remoteDataStore);


  @override
  Future<Either<Failour, String>> logininWithEmailPassword({required String email, required String password}) {
    // TODO: implement logininWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failour, String>> signupWithEmailPassword({required String name, required String email, required String password}) async {
    try{
      final userId = await remoteDataStore.signupWithEmailPassword(name: name, email: email, password: password);
      return right(userId);
    }on ServerExcepection catch (e) {
      return left(Failour());
      }
  
  }
}