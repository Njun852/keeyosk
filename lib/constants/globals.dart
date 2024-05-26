import 'package:flutter/widgets.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

bool isManagingOrders = false;
