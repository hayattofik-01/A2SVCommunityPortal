import 'package:a2sv_community_portal_mobile/features/contest/domain/entities/contest.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/usecases/get_upcoming_contests.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'get_past_contests_test.mocks.dart';


void main() {
  late GetUpcomingContests usecase;
  late MockContestRepository mockRepository;

  setUp(() {
    mockRepository = MockContestRepository();
    usecase = GetUpcomingContests(repository: mockRepository);
  });

  final upcomingContests = [
    Contest(
      title: 'Contest 1',
      description: 'Description 1',
      date: DateTime(2023, 8, 1),
      link: 'https://example.com/contest1',
    ),
    Contest(
      title: 'Contest 2',
      description: 'Description 2',
      date: DateTime(2023, 8, 5),
      link: 'https://example.com/contest2',
    ),
    Contest(
      title: 'Contest 3',
      description: 'Description 3',
      date: DateTime(2023, 8, 10),
      link: 'https://example.com/contest3',
    ),
  ];

  test('should get a list of upcoming contests from the repository', () async {
    // Arrange
    when(mockRepository.getUpcomingContests())
        .thenAnswer((_) async => Right(upcomingContests));

    // Act
    final result = await usecase.call();

    // Assert
    expect(result, Right(upcomingContests));
    verify(mockRepository.getUpcomingContests());
    verifyNoMoreInteractions(mockRepository);
  });
}