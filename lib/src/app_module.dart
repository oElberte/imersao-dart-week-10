import 'package:flutter_modular/flutter_modular.dart';
import 'modules/core/core_module.dart';
import 'modules/login/login_module.dart';
import 'modules/orders/orders_module.dart';
import 'modules/payment_type/payment_type_module.dart';
import 'modules/products/products_module.dart';
import 'modules/template/base_layout.dart';
import 'modules/template/menu/menu_enum.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/login',
          module: LoginModule(),
        ),
        ChildRoute(
          '/',
          child: (context, args) => const BaseLayout(
            body: RouterOutlet(),
          ),
          transition: TransitionType.noTransition,
          children: [
            ModuleRoute(
              Menu.paymentType.route,
              module: PaymentTypeModule(),
            ),
            ModuleRoute(
              Menu.products.route,
              module: ProductsModule(),
            ),
            ModuleRoute(
              Menu.orders.route,
              module: OrdersModule(),
            ),
          ],
        ),
      ];
}
