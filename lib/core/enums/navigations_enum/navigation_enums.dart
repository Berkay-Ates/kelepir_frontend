enum NavigationEnums {
  login('/'),
  register('/register'),
  home('/home'),
  splash('/splash'),
  image('/image');

  final String routeName;
  const NavigationEnums(this.routeName);
}
