
import 'package:dartz/dartz.dart';
import 'package:dummy_project/core/failure_exception_model.dart';
import 'package:dummy_project/ui/login_screen/domain/model/login_page_res_model.dart';

abstract class LoginPageRepo{
  Future<Either<FailureException,LoginResModel>> getLoginPageRepo(String username, String password);
}