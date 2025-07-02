import 'package:foodieland/repositories/category_repository.dart';
import 'package:get_it/get_it.dart';



class ServiceLocator {
  final GetIt locator = GetIt.instance;

  Future<void> setupLocator() async {
    locator.registerSingleton(CategoryRepository());
  }
}