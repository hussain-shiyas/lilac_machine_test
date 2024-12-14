import 'package:dummy_project/core/service/network_service.dart';
import 'package:dummy_project/ui/login_screen/data/datasource/login_page_datasource.dart';
import 'package:dummy_project/ui/login_screen/data/repository_impl/login_page_repo_impl.dart';
import 'package:dummy_project/ui/login_screen/domain/repository/login_page_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final networkServiceProvider = Provider((ref) => NetworkService());

final datasourceProvider=Provider<LoginPageDatasource>((ref){
  final networkService = ref.watch(networkServiceProvider);
  return LoginPageDatasourceImpl(networkService: networkService);
});
final repositoryProvider=Provider<LoginPageRepo>((ref){
  final dataSource=ref.watch(datasourceProvider);
  return LoginPageRepoImpl(dataSource);
});