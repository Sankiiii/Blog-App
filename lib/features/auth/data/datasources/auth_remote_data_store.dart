import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/core/error/failours.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataStore {
  Future<String> signupWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> logininWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataStore {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<String> logininWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement logininWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signupWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {'name': name},
      );
      if (response.user == null) {
        throw ServerExcepection("User is Null");
      }
      return response.user!.id;
    } catch (e) {
      throw ServerExcepection(e.toString());
    }
  }
}
