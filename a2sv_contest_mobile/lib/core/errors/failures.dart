import 'package:equatable/equatable.dart';
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message, [List<Object> props = const []]) : super();

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  @override
  // ignore: overridden_fields
  final String message;
  const ServerFailure(this.message) : super(message);
}

class GeneralFailure extends Failure {
  @override
  // ignore: overridden_fields
  final String message;
  const GeneralFailure(this.message) : super(message);
}

class InputFailure extends Failure {
  @override
  // ignore: overridden_fields
  final String message;
  const InputFailure(this.message) : super(message);
}

class CacheFailure extends Failure {
  @override
  // ignore: overridden_fields
  final String message;

  const CacheFailure(this.message) : super(message);
}

class NoConnectionFailure extends Failure {
  @override
  // ignore: overridden_fields
  final String message;

  const NoConnectionFailure(this.message) : super(message);

}