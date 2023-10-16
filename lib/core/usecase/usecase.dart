import 'package:dartz/dartz.dart';

import '../error/failures.dart';

abstract class Usecase {
  Future<Either<Failure, dynamic>> call({dynamic params});
}
