import 'dart:convert';

import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/data/datasources/user_remote_data_source.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'user_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client, SharedPreferences, http.MultipartRequest])
void main() {
  late UserRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;
  late MockSharedPreferences mockSharedPreferences;
  late MockMultipartRequest mockMultipartRequest;

  setUp(() {
    mockHttpClient = MockClient();
    mockMultipartRequest = MockMultipartRequest();
    mockSharedPreferences = MockSharedPreferences();
    dataSource = UserRemoteDataSourceImpl(
      client: mockHttpClient,
      sharedPreferences: mockSharedPreferences,
      request: mockMultipartRequest
    );
  });

  // group('editUserProfile', () {
  //   const tUserModel = UserModel(
  //       fullName: 'John Doe',
  //       email: 'john.doe@example.com',
  //       telegramUsername: 'johndoe',
  //       codeforcesHandle: 'johndoe',
  //       phoneNumber: '12345');
  //   final jsonString = jsonEncode(tUserModel.toJson());
  //   final token = jsonEncode({'token': "TOKEN"});

  //   test(
  //     'should perform a PUT request on a URL with the user data in the body',
  //     () async {
  //       // arrange
  //       when(mockSharedPreferences.getString(any)).thenReturn(token);
  //       when(mockHttpClient.post(any,
  //               body: anyNamed('body'), headers: anyNamed('headers')))
  //           .thenAnswer((_) async => http.Response(jsonString, 200));
  //       // act
  //       await dataSource.editUserProfile(tUserModel);
  //       // assert
  //       verify(mockHttpClient.post(
  //         any,
  //         body: jsonEncode(tUserModel.toJson()),
  //         headers: anyNamed('headers'),
  //       ));
  //     },
  //   );

  //   test(
  //     'should return UserModel when the response code is 200 (success)',
  //     () async {
  //       // arrange
  //       when(mockSharedPreferences.getString(any)).thenReturn(token);
  //       when(mockHttpClient.put(any,
  //               body: anyNamed('body'), headers: anyNamed('headers')))
  //           .thenAnswer((_) async => http.Response(jsonString, 200));
  //       // act
  //       final result = await dataSource.editUserProfile(tUserModel);
  //       // assert
  //       expect(result, equals(tUserModel));
  //     },
  //   );

  //   test(
  //     'should throw a ServerException when the response code is not 200 (failure)',
  //     () async {
  //       // arrange
  //       when(mockSharedPreferences.getString(any)).thenReturn(token);
  //       when(mockHttpClient.put(any,
  //               body: anyNamed('body'), headers: anyNamed('headers')))
  //           .thenAnswer(
  //               (_) async => http.Response('Something went wrong', 404));
  //       // act
  //       final call = dataSource.editUserProfile;
  //       // assert
  //       expect(() => call(tUserModel), throwsA(isA<ServerException>()));
  //     },
  //   );
  // });

  group('getUser', () {
    const tUserModel = UserModel(
        fullName: 'John Doe',
        email: 'john.doe@example.com',
        telegramUsername: 'johndoe',
        codeforcesHandle: 'johndoe',
        phoneNumber: '12345');
    final jsonString = jsonEncode({'value': tUserModel.toJson()});
    final token = jsonEncode({'token': "TOKEN"});

    test(
      'should perform a GET request on a URL with the user id being the endpoint',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(token);
        when(mockHttpClient.get(any, headers: anyNamed('headers')))
            .thenAnswer((_) async => http.Response(jsonString, 200));
        // act
        await dataSource.getUser();
        // assert
        verify(mockHttpClient.get(
          any,
          headers: anyNamed('headers'),
        ));
      },
    );

    test(
      'should return UserModel when the response code is 200 (success)',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(token);
        when(mockHttpClient.get(any, headers: anyNamed('headers')))
            .thenAnswer((_) async => http.Response(jsonString, 200));
        // act
        final result = await dataSource.getUser();
        // assert
        expect(result, equals(tUserModel));
      },
    );

    test(
      'should throw a ServerException when the response code is not 200 (failure)',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(token);
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
            (_) async => http.Response('Something went wrong', 404));
        // act
        final call = dataSource.getUser;
        // assert
        expect(() => call(), throwsA(isA<ServerException>()));
      },
    );
  });
}
