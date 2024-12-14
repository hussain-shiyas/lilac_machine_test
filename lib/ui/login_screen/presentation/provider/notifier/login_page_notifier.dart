import 'package:dummy_project/core/local_storage/storage_services.dart';
import 'package:dummy_project/ui/login_screen/domain/repository/login_page_repo.dart';
import 'package:dummy_project/ui/login_screen/presentation/state/login_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPageNotifier extends StateNotifier<LoginPageState> {
  final LoginPageRepo repo;

  LoginPageNotifier(this.repo) : super(const Initial());

  Future<void> getLoginResData(String username, String password) async {
    state = const LoginPageState.loading();
    try {
        var data = await repo.getLoginPageRepo(username,password);
        state = data.fold(((failure) {
          return LoginPageState.failure(failure.message);
        }), (success) {
          // StorageServiceMixin().addData<String>(MainBoxKeys.token, success.token??"");

          return LoginPageSuccess(success);
        });
    } catch (e) {
      state = const LoginPageState.failure('failure.message');
    }
  }
}
