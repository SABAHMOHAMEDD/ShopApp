import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/modules/Search/cubit/cubit.dart';
import 'package:shopapp/modules/Search/cubit/states.dart';
import 'package:shopapp/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  static const String RouteName = 'Search';
  var searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: true,

                leadingWidth: 40,

                backgroundColor: Colors.transparent,
                // elevation: 0,
                title: Text('search'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      defaultFormField(
                          controller: searchController,
                          type: TextInputType.text,
                          onSubmit: (String text) {
                            SearchCubit.get(context).Search(text);
                          },
                          onChange: () {},
                          validator: (String? text) {
                            if (text!.isEmpty) {
                              return 'Enter Something To Search for..';
                            }
                            return null;
                          },
                          label: 'Search',
                          prefix: Icons.search),
                      SizedBox(
                        height: 10,
                      ),
                      if (state is SearchLoadingState)
                        LinearProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      if (state is SearchSuccessState)
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) => buildListProduct(
                                  SearchCubit.get(context)
                                      .model!
                                      .data!
                                      .data![index],
                                  context,
                                  isOldPrice: false),
                              separatorBuilder: (context, index) => Container(
                                    decoration: BoxDecoration(
                                        border: Border.symmetric(
                                            horizontal: BorderSide(
                                                width: 1,
                                                color: Colors.grey
                                                    .withOpacity(.5)))),
                                  ),
                              itemCount: SearchCubit.get(context)
                                  .model!
                                  .data!
                                  .data!
                                  .length),
                        ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
