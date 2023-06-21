import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/order/order_repository.dart';
import '../../repositories/order/order_repository_impl.dart';
import 'orders_controller.dart';
import 'orders_page.dart';

class OrdersModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<OrderRepository>(
          (i) => OrderRepositoryImpl(i()),
        ),
        Bind.lazySingleton<OrdersController>(
          (i) => OrdersController(i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const OrderPage(),
        ),
      ];
}
