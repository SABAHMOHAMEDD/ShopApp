import 'package:shopapp/models/Login_model.dart';

import '../../models/ChangeFavorites.dart';

abstract class ShopStates {}

class ShopIntialState extends ShopStates {}

class ShopChageBottomNavState extends ShopStates {}

class ShopLoadingHomeDataState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {}

class ShopErrorHomeDataState extends ShopStates {}

class ShopSuccessCategoriesState extends ShopStates {}

class ShopErrorCategoriesState extends ShopStates {}

class ShopChangeFavoritesState extends ShopStates {}

class ShopSuccessChangeFavoritesState extends ShopStates {
  final ChangeFavorites model;

  ShopSuccessChangeFavoritesState(this.model);
}

class ShopSuccessGetFavoritesState extends ShopStates {}

class ShopLoadingGetFavoritesState extends ShopStates {}

class ShopErrorGetFavoritesState extends ShopStates {}

class ShopErrorChangeFavoritesState extends ShopStates {}

class ShopLoadingUserDataState extends ShopStates {}

class ShopSuccessUserDataState extends ShopStates {
  LoginModel? loginModel;

  ShopSuccessUserDataState(LoginModel? userModel);
}

class ShopErrorUserDataState extends ShopStates {}

class ShopLoadingUpdateUserState extends ShopStates {}

class ShopSuccessUpdateUserState extends ShopStates {
  LoginModel? loginModel;

  ShopSuccessUpdateUserState(LoginModel? userModel);
}

class ShopErrorUpdateUserState extends ShopStates {}
