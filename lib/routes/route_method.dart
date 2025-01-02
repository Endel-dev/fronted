//app file
import 'package:flutter/material.dart';
import 'package:piggypaisa/routes/index.dart';
import 'package:piggypaisa/screens/app_pages_screen/currency_screen/currency_screen.dart';
import 'package:piggypaisa/screens/app_pages_screen/order_history_layout/order_history_layout.dart';
import 'package:piggypaisa/screens/app_pages_screen/reviews_screen/review_screen.dart';
import 'package:piggypaisa/screens/app_pages_screen/terms_condition_screen/terms_condition_screen.dart';
import 'package:piggypaisa/screens/auth_screens/forgot_screen/forgot_screen.dart';

import '../config.dart';
import '../screens/app_pages_screen/chair_screen/chair_screen.dart';
import '../screens/app_pages_screen/checkout_screen/checkout_screen.dart';
import '../screens/app_pages_screen/coupon_screen/coupon_code_layout.dart';
import '../screens/app_pages_screen/details_screen/details_screen.dart';
import '../screens/app_pages_screen/details_screen/details_screen_second.dart';
import '../screens/app_pages_screen/help_screen/help_screen.dart';
import '../screens/app_pages_screen/language_screen/language_screen.dart';
import '../screens/app_pages_screen/notification_screen/layout/empty_notification.dart';
import '../screens/app_pages_screen/notification_screen/notification_screen.dart';
import '../screens/app_pages_screen/order_history_layout/order_details_screen.dart';
import '../screens/app_pages_screen/page_list/pagelist_screen.dart';
import '../screens/app_pages_screen/payment_screen/layout/add_card_layout.dart';
import '../screens/app_pages_screen/payment_screen/payment_layout.dart';
import '../screens/app_pages_screen/search_screen/empty_search_layout.dart';
import '../screens/app_pages_screen/setting_screen/setting_screen.dart';
import '../screens/app_pages_screen/shipping_screen/layout/add_new_address.dart';
import '../screens/app_pages_screen/shipping_screen/shipping_details_layout.dart';
import '../screens/app_pages_screen/shipping_screen/shippingoption_screen.dart';
import '../screens/app_pages_screen/tracking_order/layout/empty_order_layout.dart';
import '../screens/app_pages_screen/tracking_order/tracking_order_screen.dart';
import '../screens/auth_screens/create_password_screen/create_password_screen.dart';
import '../screens/auth_screens/login_screen/login_screen.dart';
import '../screens/auth_screens/onboarding_screen/onboarding_screen.dart';
import '../screens/auth_screens/otp_screen/otp_screen.dart';
import '../screens/auth_screens/registration_screen/registration_screen.dart';
import '../screens/auth_screens/splash_screen/splash_screen.dart';
import '../screens/bottom_screens/cart_screen/cart_screen.dart';
import '../screens/bottom_screens/cart_screen/layout/empty_cart_layout.dart';
import '../screens/bottom_screens/category_screen/category_screen.dart';
import '../screens/bottom_screens/dashboard/dashboard_screen.dart';
import '../screens/bottom_screens/home_screen/home_screen.dart';
import '../screens/bottom_screens/home_screen/layout/common_navigation_drawer.dart';
import '../screens/bottom_screens/profile_screen/layout/profile_setting_layout.dart';
import '../screens/bottom_screens/profile_screen/profile_screen.dart';
import '../screens/bottom_screens/wishlist_screen/layout/empty_wishlist_layout.dart';
import '../screens/bottom_screens/wishlist_screen/wishlist_screen.dart';
import '../widgets/common_filter/furniture_filter_layout.dart';

class AppRoute {
  Map<String, Widget Function(BuildContext)> route = {
    // routeName.splash: (p0) => const SplashScreen(),
    routeName.onBoarding: (p0) => const OnBoardingScreen(),
    routeName.login: (p0) => const LoginScreen(),
    routeName.registration: (p0) =>  RegistrationPage(),
    routeName.forgot: (p0) => const ForgotScreen(),
    routeName.changePassword: (p0) => const CreatePassword(),
    routeName.otpVerify: (p0) => const OTPScreen(),
    routeName.cartView: (p0) => const CartScreen(),
    routeName.categoryView: (p0) => const CategoryScreen(),
    routeName.homePage: (p0) => const HomeScreen(),
    routeName.profile: (p0) => const ProfileScreen(),
    routeName.wishlist: (p0) => const WishListScreen(),
    routeName.dashboard: (p0) => const Dashboard(),
    routeName.chairData: (p0) => const ChairScreen(),
    routeName.filterData: (p0) => const FurnitureFilterLayout(),
    routeName.checkOut: (p0) => const CheckOutScreen(),
    routeName.shippingDetails: (p0) => const ShippingDetailsLayout(),
    routeName.couponCode: (p0) => const CouponCodeLayout(),
    routeName.trackingOrder: (p0) => const TrackingOrderScreen(),
    routeName.notification: (p0) => const NotificationScreen(),
    routeName.emptyWishList: (p0) => const EmptyWishListLayout(),
    routeName.navigationDrawer: (p0) => const CommonNavigationDrawer(),
    routeName.pageList: (p0) => const PageList(),
    routeName.emptyNotification: (p0) => const EmptyNotification(),
    routeName.emptySearch: (p0) => const EmptySearchLayout(),
    routeName.emptyCart: (p0) => const EmptyCartLayout(),
    routeName.emptyOrderHistory: (p0) => const EmptyOrderLayout(),
    routeName.addNewAddress: (p0) => const AddNewAddress(),
    routeName.addCard: (p0) => const AddCardLayout(),
    routeName.oderTracking: (p0) => const TrackingOrderScreen(),
    routeName.payment: (p0) => const PaymentLayout(),
    routeName.shippingScreen: (p0) => const ShippingOptionScreen(),
    routeName.termsCondition: (p0) => const TermsConditionLayout(),
    routeName.profileSetting: (p0) => const ProfileSettingLayout(),
    routeName.orderHistory: (p0) => const OrderHistoryLayout(),
    routeName.orderDetails: (p0) => const OrderDetailsScreen(),
    routeName.detailsScreen: (p0) => const DetailsScreen(),
    routeName.detailsScreenSecond: (p0) => const SecondDetailsScreen(),
    routeName.currencyScreen: (p0) => const CurrencyScreen(),
    routeName.language: (p0) => const LanguageLayout(),
    routeName.setting: (p0) => const SettingLayout(),
    routeName.help: (p0) => const HelpLayout(),
    routeName.reviews:(p0)=> const ReviewScreen()
  };
}
