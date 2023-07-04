part of 'auth_cubit.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
  waiting,
}

class AuthState extends Equatable {
  final AuthStatus status;

  const AuthState._({
    this.status = AuthStatus.unknown,
  });

  const AuthState.unknown()
      : this._(
          status: AuthStatus.unknown,
        );

  const AuthState.authenticated()
      : this._(
          status: AuthStatus.authenticated,
        );

  const AuthState.unauthenticated()
      : this._(
          status: AuthStatus.unauthenticated,
        );

  const AuthState.waiting()
      : this._(
          status: AuthStatus.waiting,
        );

  @override
  List<Object?> get props => [status];
}
