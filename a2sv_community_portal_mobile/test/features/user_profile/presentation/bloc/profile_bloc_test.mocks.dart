// Mocks generated by Mockito 5.4.0 from annotations
// in a2sv_community_portal_mobile/test/features/user_profile/presentation/bloc/profile_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:a2sv_community_portal_mobile/core/errors/failures.dart' as _i6;
import 'package:a2sv_community_portal_mobile/core/usecases/usecase.dart' as _i8;
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/entities/user_entity.dart'
    as _i7;
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/repositories/user_repository.dart'
    as _i2;
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/usecases/edit_user_profile.dart'
    as _i9;
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/usecases/get_user.dart'
    as _i4;
import 'package:dartz/dartz.dart' as _i3;
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

class _FakeUserRepository_0 extends _i1.SmartFake
    implements _i2.UserRepository {
  _FakeUserRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetUser].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetUser extends _i1.Mock implements _i4.GetUser {
  MockGetUser() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UserRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeUserRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.UserRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.UserEntity>> call(
          _i8.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.UserEntity>>.value(
            _FakeEither_1<_i6.Failure, _i7.UserEntity>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.UserEntity>>);
}

/// A class which mocks [EditUserProfile].
///
/// See the documentation for Mockito's code generation for more information.
class MockEditUserProfile extends _i1.Mock implements _i9.EditUserProfile {
  MockEditUserProfile() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UserRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeUserRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.UserRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.UserEntity>> call(
          _i7.UserEntity? user) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [user],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i7.UserEntity>>.value(
            _FakeEither_1<_i6.Failure, _i7.UserEntity>(
          this,
          Invocation.method(
            #call,
            [user],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.UserEntity>>);
}