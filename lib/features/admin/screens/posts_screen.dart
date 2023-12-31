import 'package:amaxonclone/features/admin/screens/add_product_screen.dart';
import 'package:amaxonclone/features/admin/services/admin_service.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/loader.dart';
import '../../../models/product.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Product>? products;
  final AdminService adminService = AdminService();

  @override
  void initState() {

    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminService.fetchAllProducts(context);
    setState(() {

    });
  }

  void navigateToAddProduct () {
    Navigator.pushNamed(context, AddProduct.routeName);
  }
  
  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
      body: const Center(
        child: Text(
          'Products',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddProduct,
        tooltip: 'Add a Product',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
