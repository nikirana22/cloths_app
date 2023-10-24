import 'package:cloths_app/manager/api_manager.dart';
import 'package:cloths_app/model/constants.dart';
import 'package:cloths_app/model/product.dart';
import 'package:cloths_app/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import '../model/closets.dart';
import '../model/cloths.dart';

class OutfitStatistics extends StatefulWidget {
  const OutfitStatistics({Key? key}) : super(key: key);

  @override
  State<OutfitStatistics> createState() => _OutfitStatisticsState();
}

class _OutfitStatisticsState extends State<OutfitStatistics> {
  List<Cloths> cloths = [];
  List<Closets> closets = [];

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    // final double height = size.height;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Outfit Statistics'),
      ),
      body: FutureBuilder(
          future: ApiManager.getCloths(),
          builder: (_, snapshot) {
            // print('snap')
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              _initLists(snapshot.data!);
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Most wore clothes ',
                      style: TextStyle(fontSize: 19),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildProductList(cloths),
                    const Divider(),
                    const SizedBox(height: 32),
                    const Text(
                      'Most wore outfits',
                      style: TextStyle(fontSize: 19),
                    ),
                    _buildProductList(closets),
                    const Divider(),
                    const SizedBox(height: 32),
                    const Text(
                      'Least wore clothes ',
                      style: TextStyle(fontSize: 19),
                    ),
                    _buildProductList(cloths.reversed.toList()),
                    const Divider(),
                    const SizedBox(height: 32),
                    const Text(
                      'Least wore outfits',
                      style: TextStyle(fontSize: 19),
                    ),
                    _buildProductList(closets.reversed.toList()),
                  ],
                ),
              );
            }
            return const Center(
              child: Text('No Cloths Found'),
            );
          }),
    );
  }

  Widget _buildProductList(List<Product> list) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return ProductWidget(product: list[index]);
        },
        separatorBuilder: (_, __) {
          return const SizedBox(width: 12);
        },
      ),
    );
  }

  // Widget _buildProductWidget(Product product) {
  //   print(object)
  //   return ;
  // }

  void _initLists(Map<String, dynamic> map) {
    _initClosetsList(map[Constants.closetsKey]);
    _initClothsList(map[Constants.clothesKey]);
    _sortLists();
  }

  void _sortLists() {
    cloths.sort((a, b) {
      return a.times < b.times ? 1 : 0;
    });
    closets.sort((a, b) {
      return a.times < b.times ? 1 : 0;
    });
  }

  void _initClothsList(List<dynamic> list) {
    cloths = list.map((e) => Cloths.fromMap(e)).toList();
  }

  void _initClosetsList(List<dynamic> list) {
    closets = list.map((e) => Closets.fromMap(e)).toList();
  }
}
