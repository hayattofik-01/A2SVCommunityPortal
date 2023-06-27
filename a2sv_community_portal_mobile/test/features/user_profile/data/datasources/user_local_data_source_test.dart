import 'dart:convert';

import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/data/datasources/user_local_data_source.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late UserLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource =
        UserLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('getUser', () {
    const tUserModel = UserModel(
        fullName: 'John Doe',
        email: 'john.doe@example.com',
        telegramUsername: 'johndoe',
        codeforcesHandle: 'johndoe',
        phoneNumber: '12345');
    final jsonString = jsonEncode(tUserModel.toJson());
    

    test(
      'should return UserModel from SharedPreferences when there is one in the cache',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(jsonString);
        // act
        final result = await dataSource.getUser();
        // assert
        verify(mockSharedPreferences.getString(cachedUser));
        expect(result, equals(tUserModel));
      },
    );

    test(
      'should throw a CacheException when there is not a cached value',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(null);
        // act
        final call = dataSource.getUser;
        // assert
        expect(() => call(), throwsA(isA<CacheException>()));
      },
    );
  });

  group('cacheUser', () {
    const tUserModel = UserModel(
        fullName: 'John Doe',
        email: 'john.doe@example.com',
        telegramUsername: 'johndoe',
        codeforcesHandle: 'johndoe',
        phoneNumber: '12345');

    test(
      'should call SharedPreferences to cache the data',
      () async {
        // arrange
        when(mockSharedPreferences.setString(any, any))
            .thenAnswer((_) async => true);
        // act
        await dataSource.cacheUser(tUserModel);
        // assert
        final expectedJsonString = jsonEncode(tUserModel.toJson());
        verify(mockSharedPreferences.setString(
          cachedUser,
          expectedJsonString,
        ));
      },
    );
  });
}
