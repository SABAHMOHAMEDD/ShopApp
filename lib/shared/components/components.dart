import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../layout/cubit/cubit.dart';
import '../../theme/mytheme.dart';

Widget defaultButton({
  double width = double.infinity,
  double? height,
  required Color background,
  bool isUpperCase = true,
  double radius = 0.0,
  required Function? function(),
  required String text,
}) =>
    Container(
      height: height,
      width: width,
      child: MaterialButton(
        elevation: 0,
        color: MyTheme.primaryColor,
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: MyTheme.primaryColor),
    );

Widget defaultFormField(
        {required TextEditingController controller,
        required TextInputType type,
        void Function(String)? onSubmit,
        required Function onChange,
        required String? Function(String?)? validator,
        required String label,
        required IconData prefix,
        IconData? suffix,
        bool isPassword = false}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange(),
      validator: validator,
      cursorColor: MyTheme.primaryColor,
      decoration: InputDecoration(
        suffixIconColor: MyTheme.primaryColor,
        labelText: label,
        prefixIcon: Icon(
          prefix,
          color: MyTheme.primaryColor,
        ),
        suffixIcon: suffix != null ? Icon(suffix) : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: MyTheme.primaryColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyTheme.primaryColor, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyTheme.primaryColor, width: 1)),
        labelStyle: TextStyle(color: MyTheme.primaryColor),
      ),
    );

void showToast({
  required String text,
  required ToastState state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastState { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;

    case ToastState.ERROR:
      color = Colors.red;
      break;

    case ToastState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget buildListProduct(model, context, {bool isOldPrice = true}) => Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 120,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                  height: 120,
                  image: NetworkImage(model?.image ?? ""),
                  width: 120),
              if (model?.discount != 0 && isOldPrice)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.red,
                  child: Text(
                    'DISCOUNT',
                    style: TextStyle(
                        fontSize: 8,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model?.name ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, height: 1.3),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      '${model?.price.round()}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if (model?.discount != 0 && isOldPrice)
                      Text(
                        '${model?.oldPrice?.round()}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          ShopCubit.get(context).changefavorites(model?.id);
                        },
                        icon: CircleAvatar(
                          radius: 15,
                          backgroundColor:
                              ShopCubit.get(context).favourites[model?.id]!
                                  ? Colors.black
                                  : Colors.grey,
                          child: Icon(
                            Icons.favorite_border,
                            size: 14,
                            color: Colors.white,
                          ),
                        ))
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
