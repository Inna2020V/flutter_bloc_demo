import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lesson_11_bloc_shopping_list/bloc/cart_bloc.dart';
import 'package:flutter_lesson_11_bloc_shopping_list/bloc/cart_state.dart';

import 'product_list.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CartBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Shopping list'),
            actions: <Widget>[
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(primary: Colors.white),
                      onPressed: () {},
                      icon: Icon(Icons.shopping_cart),
                      label: Text(''),
                      key: Key('cart'),
                    ),
                  ),
                  BlocBuilder<CartBloc, CartState>(builder: (_, cartState) {
                    List<int> cartItem = cartState.cartItem;
                    return Positioned(
                      left: 30,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red),
                        child: Text(
                          '${cartItem.length}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
          body: ProductList(),
        ));
  }
}
