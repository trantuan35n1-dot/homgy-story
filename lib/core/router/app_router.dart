import 'package:go_router/go_router.dart';
import 'package:mvvm/dardboard/view/dardboad_first.dart';
import 'package:mvvm/dardboard/view/shopping_cart.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return DardboadFirst();
      },
    ),
    GoRoute(
      path: '/shoppingCart',
      builder: (context, state) {
        return ShoppingCart();
      },
    ),
  ],
);
