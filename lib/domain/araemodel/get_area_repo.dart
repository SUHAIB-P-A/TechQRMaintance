import 'package:dartz/dartz.dart';
import 'package:techqrmaintance/domain/araemodel/area_model/area_model.dart';
import 'package:techqrmaintance/domain/araemodel/area_model/areasaas.dart';
import 'package:techqrmaintance/domain/core/failures/main_failurs.dart';

abstract class GetAreaRepo {
  Future<Either<MainFailurs, List<AreaModelSaas>>> getArea();
}
