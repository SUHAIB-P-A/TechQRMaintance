import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:techqrmaintance/core/strings.dart';
import 'package:techqrmaintance/domain/core/failures/main_failurs.dart';
import 'package:techqrmaintance/domain/token/get_user_token_repo.dart';
import 'package:techqrmaintance/domain/token/token/token.dart';

@LazySingleton(as: GetTokenRepo)
class GetTokenServices implements GetTokenRepo {
  late final Dio dioo = Dio();

  @override
  Future<Either<MainFailurs, String>> getToken({
    required String email,
    required String password,
  }) async {
    try {
      final Response respo = await dioo.get(
        '$kBaseURL$kLogin',
        queryParameters: {
          'email': email,
          'password': password,
        },
      );

      final tokenData = Token.fromJson(respo.data);
      final token = tokenData.token;

      if (token != null && token.isNotEmpty) {
        return Right(token);
      } else {
        return Left(MainFailurs.serverFailure());
      }
    } catch (e) {
      return Left(MainFailurs.clientFailure());
    }
  }
}
