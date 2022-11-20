import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/cubit/cubit.dart';
import 'package:shopapp/layout/cubit/states.dart';
import 'package:shopapp/models/CategoriesModel.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: ShopCubit.get(context).categoriesModel !=
                null, // if category data have arrived,
            builder: (context) => ListView.separated(
                itemBuilder: (context, index) => buildCatItem(
                    ShopCubit.get(context).categoriesModel!.data!.data![index]),
                separatorBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(
                                  width: 1,
                                  color: Colors.grey.withOpacity(.5)))),
                    ),
                itemCount:
                    ShopCubit.get(context).categoriesModel!.data!.data!.length),
            fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ));
      },
    );
  }

  Widget buildCatItem(DataModel model) => Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                image: NetworkImage(model.image ?? '')),
            SizedBox(
              width: 20,
            ),
            Text(
              model.name ?? '',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            Spacer(),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_arrow_right_sharp,
                  size: 25,
                  color: Colors.black.withOpacity(.8),
                ))
          ],
        ),
      );
}
