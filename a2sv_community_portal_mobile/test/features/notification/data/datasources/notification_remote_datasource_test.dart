import 'dart:convert';
import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/data/datasources/notification_remote_datasource.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/data/model/notification.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/entities/notification.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notification_remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client, SharedPreferences])
void main() {
  late NotificationRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockHttpClient = MockClient();
    mockSharedPreferences = MockSharedPreferences();
    dataSource = NotificationRemoteDataSourceImpl(
      client: mockHttpClient,
      sharedPreferences: mockSharedPreferences,
    );
  });

  const tNotification = NotificationModel(
    title: 'Test Notification',
    content: 'This is a test notification.',
    type: 'test',
    isRead: false,
  );

  final tNotificationsList = [
    tNotification,
    tNotification,
    tNotification,
  ];

  const cachedTokenJson = '{"token": "test_token"}';

  group('getNotifications', () {
    final tUri = Uri.parse(
        'https://a2sv-community-portal-api.onrender.com/api/Notifications?pageNumber=1&pageSize=10');

    test(
      'should perform a GET request on the specified URL with the cached token header',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(cachedTokenJson);
        final headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer test_token',
        };
        final response = http.Response(
          json.encode({
            "value": {
              "items": [
                tNotification.toJson(),
                tNotification.toJson(),
                tNotification.toJson(),
              ]
            }
          }),
          200,
        );
        when(mockHttpClient.get(tUri, headers: headers))
            .thenAnswer((_) async => response);
        // act
        await dataSource.getNotifications();
        // assert
        verify(mockHttpClient.get(tUri, headers: headers));
      },
    );

    test(
      'should return a list of NotificationModel when the request is successful',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(cachedTokenJson);
        final headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer test_token',
        };
        final response = http.Response(
          json.encode({
            "value": {
              "items": [
                tNotification.toJson(),
                tNotification.toJson(),
                tNotification.toJson(),
              ]
            }
          }),
          200,
        );
        when(mockHttpClient.get(tUri, headers: headers))
            .thenAnswer((_) async => response);
        // act
        final result = await dataSource.getNotifications();
        // assert
        expect(result, tNotificationsList);
      },
    );

    test(
      'should throw a ServerException when the request is unsuccessful',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(cachedTokenJson);
        final headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer test_token',
        };
        final response = http.Response('Error', 404);
        when(mockHttpClient.get(tUri, headers: headers))
            .thenAnswer((_) async => response);
        // act
        final call = dataSource.getNotifications;
        // assert
        expect(() => call(), throwsA(isInstanceOf<ServerException>()));
      },
    );
  });

  group('sendIsRead', () {
    final tUri = Uri.parse(
        'https://a2sv-community-portal-api.onrender.com/api/Notifications');

    test(
      'should perform a POST request on the specified URL with the cached token header',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(cachedTokenJson);
        final headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer test_token',
        };
        final response = http.Response('', 200);
        when(mockHttpClient.post(tUri, headers: headers))
            .thenAnswer((_) async => response);
        // act
        await dataSource.sendIsRead();
        // assert
        verify(mockHttpClient.post(tUri, headers: headers));
      },
    );

    test(
      'should return void when the request is successful',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(cachedTokenJson);
        //  Great, let me continue the code for the `sendIsRead` test:
        final headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer test_token',
        };
        final response = http.Response('', 200);
        when(mockHttpClient.post(tUri, headers: headers))
            .thenAnswer((_) async => response);
        // act
        await dataSource.sendIsRead();
        // assert
        verify(
            mockHttpClient.post(tUri, headers: headers, ));
      },
    );

    test(
      'should throw a ServerException when the request is unsuccessful',
      () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(cachedTokenJson);
        final headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer test_token',
        };
        final response = http.Response('Error', 404);
        when(mockHttpClient.post(tUri, headers: headers))
            .thenAnswer((_) async => response);
        // act
        final call = dataSource.sendIsRead;
        // assert
        expect(() => call(), throwsA(isInstanceOf<ServerException>()));
      },
    );
  });
}
