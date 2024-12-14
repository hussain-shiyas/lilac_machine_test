
import 'package:dartz/dartz.dart';
import 'package:dummy_project/core/failure_exception_model.dart';
import 'package:dummy_project/core/service/network_service.dart';
import 'package:dummy_project/ui/login_screen/domain/model/login_page_res_model.dart';

abstract class LoginPageDatasource {
  Future<Either<FailureException, LoginResModel>> getLoginPageDatasource(
      String username, String password);
}

class LoginPageDatasourceImpl implements LoginPageDatasource {
  final NetworkService networkService;

  LoginPageDatasourceImpl({required this.networkService});

  @override
  Future<Either<FailureException, LoginResModel>>
      getLoginPageDatasource(String username, String password) async {
    try {
      var body =User(
        email: username,
        password: password,
      );
      // var body= {
      //   "username":username,
      //   "password":password,
      // };
      final data = await networkService.post('vendor-login',body: body.toJson());
      return Right(LoginResModel.fromJson(data));
    } catch (e) {
      return Left(FailureException( message: 'Failed to fetch data from the server',
        statusCode: '500'
      ));
    }
  }
}
class User {
  final String email;
  final String password;

  User({required this.email, required this.password});

  // Factory method to create a User instance from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
    );
  }

  // Method to convert a User instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

