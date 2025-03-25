import 'package:day25_task/Model/Products.dart';
import 'package:day25_task/Provider/Product_provider.dart';
import 'package:day25_task/Screens/Product_Details_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).facth();
    });
  }

  @override
  Widget build(BuildContext context) {
    var list = context.watch<ProductProvider>().plist ?? [];
    var isLoading = context.watch<ProductProvider>().isloading;

    var filtered = list.where((product) {
      return product.title!.toLowerCase().startsWith(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Product List"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    hintText: "Search Products...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
            ),
            Expanded(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : list.isEmpty
                      ? Center(child: Text('No products found'))
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListView.separated(
                            itemCount: filtered.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                width: double.infinity,
                                height: 80,
                                child: Card(
                                  elevation: 7,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListTile(
                                    leading: Image(
                                      image: NetworkImage(
                                          "${list[index].thumbnail}"),
                                    ),
                                    title: Text("${filtered[index].title}"),
                                    trailing:Icon(Icons.arrow_forward_ios_outlined,),
                                    onTap: () {
                                      Navigator.push(context, 
                                          MaterialPageRoute(builder: (BuildContext context) { 
                                            return ProductDetailsScreen(product: filtered[index],);
                                          }));
                                    },
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 20,
                              );
                            },
                          ),
                        ),
            )
          ],
        ));
  }
}
