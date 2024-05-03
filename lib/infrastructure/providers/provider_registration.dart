import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lvit/infrastructure/providers/dashboard_provider.dart';
import 'package:lvit/infrastructure/providers/home_provider.dart';

final dashboardProvider =
    ChangeNotifierProvider<DashboardProvider>((ref) => DashboardProvider());
final homeProvider =
    ChangeNotifierProvider<HomeProvider>((ref) => HomeProvider());
