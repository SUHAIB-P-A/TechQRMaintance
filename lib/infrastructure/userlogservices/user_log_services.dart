import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techqrmaintance/core/strings.dart';
import 'package:techqrmaintance/domain/core/failures/main_failurs.dart';
import 'package:techqrmaintance/domain/usermodel/user_log_repo.dart';
import 'package:techqrmaintance/domain/usermodel/user_model_list/user_model_list_saas/user_model.dart';
import 'package:techqrmaintance/domain/usermodel/user_model_list/user_model_list_saas/user_model_list_saas.dart';
import 'package:techqrmaintance/infrastructure/api_token_generator.dart';

@LazySingleton(as: UserLogRepo)
class UserLogServices implements UserLogRepo {
  ApiServices userLogApi = ApiServices();
  @override
  Future<Either<MainFailurs, UserModel>> getUserLogList(email) async {
    try {
      final response = await userLogApi.dio.get(kBaseURL + kuserADD);

      if (response.statusCode == 200) {
        final userList = UserModelListSaas.fromJson(response.data);

        // Check if data is null or empty
        if (userList.data == null || userList.data!.isEmpty) {
          return Left(MainFailurs.clientFailure());
        }

        // Sanitize the input email
        final sanitizedEmail = email.trim().toLowerCase();

        // Log all emails for debugging
        userList.data!.map((u) => u.email?.toLowerCase()).toList();

        // Find matching user with case-insensitive comparison
        final matchingUser = userList.data!.firstWhere(
          (user) =>
              user.email != null &&
              user.email!.trim().toLowerCase() == sanitizedEmail,
          orElse: () => UserModel(), // Return empty Customer if not found
        );

        if (matchingUser.email == null) {
          log('No user found with email: $sanitizedEmail');
          return Left(MainFailurs.clientFailure());
        }
        // store the user to SP
        final SharedPreferences user = await SharedPreferences.getInstance();
        //String jsonUser = jsonEncode(matchingUser);
        //await user.setString("userItem", jsonUser);
        await user.setInt('userID', matchingUser.id!);
        log("saving completed");

        return Right(matchingUser);
      } else {
        //userLogApi.clearStoredToken();
        log('API Error: Status code ${response.statusCode}');
        return Left(MainFailurs.serverFailure());
      }
    } on DioException catch (e) {
      userLogApi.clearStoredToken();
      log('DioException: ${e.message}');
      return Left(MainFailurs.clientFailure());
    } catch (e) {
      userLogApi.clearStoredToken();
      log('Unexpected Error: $e', name: "logservice");
      return Left(MainFailurs.clientFailure());
    }
  }
}
