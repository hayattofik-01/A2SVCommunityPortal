import 'dart:convert';
import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/data/models/application_step_model.dart';
import 'package:http/http.dart' as http;

abstract class ApplicationStepRemoteDataSource {
  Future<dynamic> getApplicationStepFromApi();
}

class ApplicationStepRemoteDataSourceImpl
    implements ApplicationStepRemoteDataSource {
  final http.Client client;

  ApplicationStepRemoteDataSourceImpl({required this.client});

  @override
  Future<dynamic> getApplicationStepFromApi() async {
    final response = await client.get(
      Uri.parse('https://a2sv-community-portal-api.onrender.com/api/Steps'),
      headers: {'content-type': 'application/json'},
    );
    // for checking with mock data
    // var response = {
    //   "status": 200,
    //   "isSuccess": true,
    //   "error": null,
    //   "body": 
    //     {
    //       "isCompleted": true,
    //       "stepName": "Setup Profile",
    //       "id": 1,
    //       "subSteps": [
    //         {
    //           "id": 1,
    //           "isCompleted": true,
    //           "subStepName": "Sign Up",
    //           "mainStepId": 1,
    //           "description":
    //               "Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus, dignissimos reiciendis. Pariatur et placeat at deleniti, laboriosam consequuntur. Porro dolorem cum unde praesentium. Temporibus in veritatis nemo perspiciatis fuga quia!"
    //         },
    //         {
    //           "id": 2,
    //           "isCompleted": true,
    //           "subStepName": "Codeforce profile",
    //           "mainStepId": 1,
    //           "description":
    //               "Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus, dignissimos reiciendis. Pariatur et placeat at deleniti, laboriosam consequuntur. Porro dolorem cum unde praesentium. Temporibus in veritatis nemo perspiciatis fuga quia!"
    //         },
    //         {
    //           "id": 3,
    //           "isCompleted": true,
    //           "subStepName": "Github profile",
    //           "mainStepId": 1,
    //           "description":
    //               "Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus, dignissimos reiciendis. Pariatur et placeat at deleniti, laboriosam consequuntur. Porro dolorem cum unde praesentium. Temporibus in veritatis nemo perspiciatis fuga quia!"
    //         },
    //         {
    //           "id": 4,
    //           "isCompleted": true,
    //           "subStepName": "Leetcode profile",
    //           "mainStepId": 1,
    //           "description":
    //               "Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus, dignissimos reiciendis. Pariatur et placeat at deleniti, laboriosam consequuntur. Porro dolorem cum unde praesentium. Temporibus in veritatis nemo perspiciatis fuga quia!"
    //         }
    //       ]
    //     },
    //     {
    //       "isCompleted": false,
    //       "stepName": "Participate in A2SV Contest",
    //       "id": 2,
    //       "subSteps": [
    //         {
    //           "id": 1,
    //           "isCompleted": false,
    //           "subStepName": "Participate in Your first A2SV contest",
    //           "mainStepId": 2,
    //           "description":
    //               "Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus, dignissimos reiciendis. Pariatur et placeat at deleniti, laboriosam consequuntur. Porro dolorem cum unde praesentium. Temporibus in veritatis nemo perspiciatis fuga quia!"
    //         },
    //         {
    //           "id": 2,
    //           "isCompleted": false,
    //           "subStepName": "Participate in Your second A2SV contest",
    //           "mainStepId": 2,
    //           "description":
    //               "Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus, dignissimos reiciendis. Pariatur et placeat at deleniti, laboriosam consequuntur. Porro dolorem cum unde praesentium. Temporibus in veritatis nemo perspiciatis fuga quia!"
    //         }
    //       ]
    //     },
    //     {
    //       "isCompleted": false,
    //       "stepName": "Resume",
    //       "id": 3,
    //       "subSteps": [
    //         {
    //           "id": 1,
    //           "isCompleted": false,
    //           "subStepName": "Upload your resume",
    //           "mainStepId": 3,
    //           "description":
    //               "Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus, dignissimos reiciendis. Pariatur et placeat at deleniti, laboriosam consequuntur. Porro dolorem cum unde praesentium. Temporibus in veritatis nemo perspiciatis fuga quia!"
    //         }
    //       ]
    //     },
    //     {
    //       "isCompleted": false,
    //       "stepName": "Ready to Apply",
    //       "id": 4,
    //       "subSteps": [
    //         {
    //           "id": 1,
    //           "isCompleted": false,
    //           "subStepName": "Apply to join A2SV community",
    //           "mainStepId": 4,
    //           "description":
    //               "Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus, dignissimos reiciendis. Pariatur et placeat at deleniti, laboriosam consequuntur. Porro dolorem cum unde praesentium. Temporibus in veritatis nemo perspiciatis fuga quia!"
    //         }
    //       ]
    //     },
    //     {
    //       "isCompleted": false,
    //       "stepName": "Waitlist",
    //       "id": 5,
    //       "subSteps": [
    //         {
    //           "id": 1,
    //           "isCompleted": false,
    //           "subStepName": "Apply to join A2SV community",
    //           "mainStepId": 1,
    //           "description":
    //               "Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus, dignissimos reiciendis. Pariatur etplaceat at deleniti, laboriosam consequuntur. Porro dolorem cum unde praesentium. Temporibus in veritatis nemo perspiciatis fuga quia!"
    //         }
    //       ]
    //     }
    //   ]
    // };
    if (response.statusCode != 200) {
      throw ServerException('server error');
    } else {
      final responseBody = jsonDecode(response.body);
      return responseBody;
    }
  }
}
