abstract class Failure{
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}
class UserFailure extends Failure {
  UserFailure(super.message);
}