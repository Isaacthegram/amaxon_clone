import 'package:amaxonclone/common/widgets/single_product.dart';
import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  //temporary list

  List list =
  [
    'https://images.unsplash.com/photo-1634848860108-6d8368f5a0b3?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOXx8fGVufDB8fHx8fA%3D%3D'
    'https://images.unsplash.com/photo-1634848860108-6d8368f5a0b3?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOXx8fGVufDB8fHx8fA%3D%3D'
    'https://images.unsplash.com/photo-1634848860108-6d8368f5a0b3?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOXx8fGVufDB8fHx8fA%3D%3D'
    'https://images.unsplash.com/photo-1634848860108-6d8368f5a0b3?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOXx8fGVufDB8fHx8fA%3D%3D'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text('Your Orders', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
            ),

            Container(
              padding: const EdgeInsets.only(right: 15),
              child:  Text('See all',
                style: TextStyle(
                color: GlobalVariables.selectedNavBarColor,
              ),),
            ),
          ],
        ),
        //display orders
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, top: 20, right: 0,),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
              itemBuilder: (context, index) {
              return SingleProduct(
                image: list[index],
              );
              },
          ),
        ),
      ],
    );
  }
}
