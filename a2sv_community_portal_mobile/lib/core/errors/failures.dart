import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final String message;
  const ServerFailure(this.message);
}

class InputFailure extends Failure {
  final String message;
  const InputFailure(this.message);
}

class CacheFailure extends Failure {
  final String message;

  const CacheFailure(this.message);
}
class NoConnectionFailure implements Failure {
  final String message;

  NoConnectionFailure(this.message);
  
  @override
  List<Object> get props => throw UnimplementedError();
  
  @override
  bool? get stringify => throw UnimplementedError();
}