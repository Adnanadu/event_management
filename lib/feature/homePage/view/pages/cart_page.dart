import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CartPage extends HookWidget {
  const CartPage({super.key});
  static String routePath = "/cartpage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
