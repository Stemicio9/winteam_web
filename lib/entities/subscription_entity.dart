class SubscriptionEntity{
  String title;
  String price;
  List<String> features;
  bool isActive;

  SubscriptionEntity({required this.price,required this.title, required this.features, required this.isActive});

}