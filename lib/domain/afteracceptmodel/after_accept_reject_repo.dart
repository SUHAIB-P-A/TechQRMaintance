import 'package:dartz/dartz.dart';
import 'package:techqrmaintance/domain/afteracceptmodel/afte_accept_services/afte_accept_services.dart';
import 'package:techqrmaintance/domain/afteracceptmodel/afte_accept_services/after_accept.dart';
import 'package:techqrmaintance/domain/core/failures/main_failurs.dart';

abstract class AfterAcceptRejectRepo {
  Future<Either<MainFailurs, AfteAcceptServices>> accept({required String id});
  Future<Either<MainFailurs, AfteAcceptServices>> reject({required String id});
}
