import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieland/models/category_model/category_model.dart';

final categoryForFilterProvider = StateProvider<CategoryModel?>((ref) => null);
