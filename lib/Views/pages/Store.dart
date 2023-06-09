// ignore: file_names
import 'package:flutter/material.dart';

import 'package:talktome/Model/product.dart';

import '../../constants/constants.dart';
import '../widgets/my_drawer.dart';



class Strore extends StatefulWidget {
  const Strore({super.key});

  @override
  State<Strore> createState() => _StroreState();
}

class _StroreState extends State<Strore> {

  var products=[
    product("1", "imge1", 125, false, "description"),
    product("2", "imge2", 0, true, "description"),
    product("3", "imge3", 456, false, "description"),
    product("4", "imge4", 0, true, "description"),
    product("5", "imge5", 184, false, "description"),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF021638)
            : Colors.white,
        drawer: const MyDrawer(),
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                  icon: (Icon(
                    Icons.search_off_outlined,
                    color: myColor,
                    size: 30,
                  )),
                  onPressed: () {
                  
                  }),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,),
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: products.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(products[index].getTitle())
                
                ,
              );
            }),
    );
  }
}