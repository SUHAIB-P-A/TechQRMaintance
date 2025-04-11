import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:techqrmaintance/core/strings.dart';
import 'package:techqrmaintance/domain/afteracceptmodel/afte_accept_services/afte_accept_services.dart';
import 'package:techqrmaintance/domain/afteracceptmodel/after_accept_reject_repo.dart';
import 'package:techqrmaintance/domain/core/failures/main_failurs.dart';
import 'package:techqrmaintance/domain/core/servicesreq_t_user/service_t_user.dart';

@LazySingleton(as: AfterAcceptRejectRepo)
class AfterServiceAcceptReject implements AfterAcceptRejectRepo {
  ServiveTuser api = ServiveTuser();
  @override
  Future<Either<MainFailurs, AfteAcceptServices>> accept(
      {required String id}) async {
    log("$kBaseURL$kServices$id/accept");
    try {
      final Response respo =
          await api.apidio.post("$kBaseURL$kServices$id/accept");
      if (respo.statusCode == 200) {
        final data = AfteAcceptServices.fromJson(respo.data);
        return Right(data);
      } else {
        return Left(MainFailurs.clientFailure());
      }
    } catch (e) {
      log(e.toString(), name: "accept");
      api.clearStoredToken();
      return Left(MainFailurs.serverFailure());
    }
  }

  @override
  Future<Either<MainFailurs, AfteAcceptServices>> reject(
      {required String id}) async {
    log("$kBaseURL$kServices$id/reject");
    try {
      final Response respo =
          await api.apidio.post("$kBaseURL$kServices$id/reject");
      if (respo.statusCode == 200) {
        final data = AfteAcceptServices.fromJson(respo.data);
        return Right(data);
      } else {
        return Left(MainFailurs.clientFailure());
      }
    } catch (e) {
      api.clearStoredToken();
      log(e.toString(), name: "reject");
      return Left(MainFailurs.serverFailure());
    }
  }
}
