import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/shared/components/components.dart';

import '../layout/cubit/cubit.dart';
import '../layout/cubit/states.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
            condition: ShopCubit.get(context).favoritesModel != null &&
                state is! ShopLoadingGetFavoritesState,
            // if category data have arrived,
            builder: (context) => ListView.separated(
                itemBuilder: (context, index) => buildListProduct(
                    ShopCubit.get(context)
                        .favoritesModel!
                        .data!
                        .data![index]
                        .product,
                    context),
                separatorBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(
                                  width: 1,
                                  color: Colors.grey.withOpacity(.5)))),
                    ),
                itemCount:
                    ShopCubit.get(context).favoritesModel!.data!.data!.length),
            fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ));
      },
    );
  }
}
