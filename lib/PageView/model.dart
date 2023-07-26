class AppBanner {
  final int id;
  final String title;
  final String image;
  AppBanner({required this.id, required this.image, required this.title});
}

List<AppBanner> appList = [
  AppBanner(id: 1, image: 'assets/notificationbell.jpg', title: 'FirstTitle'),
  AppBanner(id: 1, image: 'assets/notificationbell.jpg', title: 'SecondTitle'),
  AppBanner(id: 1, image: 'assets/notificationbell.jpg', title: 'ThirdTitle'),
];
