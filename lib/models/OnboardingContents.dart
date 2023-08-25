class OnBoardingContents {
  final String title;
  final String image;
  final String desc;

  OnBoardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnBoardingContents> contents = [
  OnBoardingContents(
    title: "Get Your worker and get the Fix every thing",
    image: "assets/images/telent.png",
    desc: "Remember to keep track of your professional accomplishments.",
  ),
  OnBoardingContents(
    title: "Stay at home and your fix will occur",
    image: "assets/images/img_1.png",
    desc:
    "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnBoardingContents(
    title: "Get notified when worker ready",
    image: "assets/images/img_2.png",
    desc:
    "Take control of notifications, collaborate live or on your own time.",
  ),
];