// Mocks generated by Mockito 5.4.2 from annotations
// in a2sv_community_portal_mobile/test/features/authentication/domain/login_user_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:a2sv_community_portal_mobile/core/errors/failures.dart' as _i5;
import 'package:a2sv_community_portal_mobile/features/authentication/domain/entities/login.dart'
    as _i6;
import 'package:a2sv_community_portal_mobile/features/authentication/domain/entities/registration_payload.dart'
    as _i7;
import 'package:a2sv_community_portal_mobile/features/authentication/domain/repositories/auth_repository.dart'
    as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i3.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Login>> loginUser(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #loginUser,
          [
            email,
            password,
          ],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Login>>.value(
            _FakeEither_0<_i5.Failure, _i6.Login>(
          this,
          Invocation.method(
            #loginUser,
            [
              email,
              password,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Login>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Login>> fetchCachedToken() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchCachedToken,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Login>>.value(
            _FakeEither_0<_i5.Failure, _i6.Login>(
          this,
          Invocation.method(
            #fetchCachedToken,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Login>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Login>> register(
          _i7.RegistrationPayload? user) =>
      (super.noSuchMethod(
        Invocation.method(
          #register,
          [user],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Login>>.value(
            _FakeEither_0<_i5.Failure, _i6.Login>(
          this,
          Invocation.method(
            #register,
            [user],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Login>>);
}
