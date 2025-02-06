import 'package:dartz/dartz.dart';
import 'package:techqrmaintance/domain/core/failures/main_failurs.dart';

abstract class SplashCheckRepo {
  Future<Either<MainFailurs, bool>> checkLoginOrNot();
}
