// Mocks generated by Mockito 5.4.2 from annotations
// in a2sv_community_portal_mobile/test/features/contest/domain/get_past_contests_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:a2sv_community_portal_mobile/core/errors/failures.dart' as _i5;
import 'package:a2sv_community_portal_mobile/features/contest/domain/entities/contest.dart'
    as _i6;
import 'package:a2sv_community_portal_mobile/features/contest/domain/repository/contest_repository.dart'
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

/// A class which mocks [ContestRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockContestRepository extends _i1.Mock implements _i3.ContestRepository {
  MockContestRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Contest>>>
      getUpcomingContests() => (super.noSuchMethod(
            Invocation.method(
              #getUpcomingContests,
              [],
            ),
            returnValue:
                _i4.Future<_i2.Either<_i5.Failure, List<_i6.Contest>>>.value(
                    _FakeEither_0<_i5.Failure, List<_i6.Contest>>(
              this,
              Invocation.method(
                #getUpcomingContests,
                [],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Contest>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Contest>>> getPastContests() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPastContests,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Contest>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Contest>>(
          this,
          Invocation.method(
            #getPastContests,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Contest>>>);
}