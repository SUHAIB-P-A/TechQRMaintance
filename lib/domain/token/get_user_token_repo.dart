import 'package:dartz/dartz.dart';
import 'package:techqrmaintance/domain/core/failures/main_failurs.dart';

abstract class GetTokenRepo {
  Future<Either<MainFailurs, String>> getToken({
    required String email,
    required String password,
  });
}