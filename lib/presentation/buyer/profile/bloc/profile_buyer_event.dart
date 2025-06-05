part of 'profile_buyer_bloc.dart';

sealed class ProfileBuyerEvent {}

class AddProfileBuyerEvent extends ProfileBuyerEvent {
  final Buyerprofilerequestmodel requestModel;

  AddProfileBuyerEvent({required this.requestModel});
}

class GetProfileBuyerEvent extends ProfileBuyerEvent {}
