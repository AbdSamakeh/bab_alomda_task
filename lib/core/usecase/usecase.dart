import 'package:dartz/dartz.dart';

import '../error/failures.dart';

abstract class BaseUsecase {
  Future<Either<Failure, dynamic>> call({dynamic params});
}
