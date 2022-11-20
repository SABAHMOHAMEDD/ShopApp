import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/cubit/cubit.dart';
import 'package:shopapp/layout/cubit/states.dart';
import 'package:shopapp/shared/components/components.dart';

import '../shared/components/constant.dart';

class SettinsScreen extends StatelessWidget {
  var nameContoller = TextEditingController();
  var phoneContoller = TextEditingController();
  var emailContoller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var model = ShopCubit.get(context).userModel;
          nameContoller.text = model?.data?.name ?? "";
          emailContoller.text = model?.data?.email ?? "";
          phoneContoller.text = model?.data?.phone ?? "";

          return ConditionalBuilder(
            condition: ShopCubit.get(context).userModel != null,
            builder: (context) => Padding(
              padding: EdgeInsets.all(35),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const CircleAvatar(
                        //   foregroundColor: Colors.black,
                        backgroundImage: AssetImage(
                          'assets/images/profile_sized.jpeg',
                        ),
                        radius: 60,
                        //  backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      if (state is ShopLoadingUpdateUserState)
                        LinearProgressIndicator(),
                      SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                          controller: nameContoller,
                          type: TextInputType.name,
                          onChange: () {},
                          validator: (String? text) {
                            if (text!.isEmpty) {
                              return 'please enter Your phone number';
                            }
                            return null;
                          },
                          label: 'Name',
                          prefix: Icons.person),
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                          controller: emailContoller,
                          type: TextInputType.name,
                          onChange: () {},
                          validator: (String? text) {
                            if (text!.isEmpty) {
                              return 'please enter Your phone number';
                            }
                            return null;
                          },
                          label: 'Email',
                          prefix: Icons.email),
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                          controller: phoneContoller,
                          type: TextInputType.name,
                          onChange: () {},
                          validator: (String? text) {
                            if (text!.isEmpty) {
                              return 'please enter Your phone number';
                            }
                            return null;
                          },
                          label: 'Phone',
                          prefix: Icons.phone),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: defaultButton(
                                height: 45,
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    ShopCubit.get(context).UpdateUserData(
                                        name: nameContoller.text,
                                        email: emailContoller.text,
                                        phone: phoneContoller.text);
                                  }
                                },
                                text: 'Update',
                                background: Colors.green),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: defaultButton(
                                height: 45,
                                function: () {
                                  SignOut(context);
                                },
                                text: 'LogOut',
                                background: Colors.red),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        });
  }
}
