class TourismPlace {
  String name;
  String location;
  String decription;
  String openDays;
  String openTime;
  String ticketPrice;
  String imageAsset;
  List<String> imageUrl;

  TourismPlace({
    required this.name,
    required this.location,
    required this.decription,
    required this.openDays,
    required this.openTime,
    required this.ticketPrice,
    required this.imageAsset,
    required this.imageUrl,
  });
}

var torismPlaceList = [
  TourismPlace(
      name: 'Sensoji',
      location: "Vihara",
      decription: "Salah satu tempat wisata yang yang bagus banget",
      openDays: 'Everiday',
      openTime: '09.00 - 16.00',
      ticketPrice: 'Free',
      imageAsset: '',
      imageUrl: [
        'https://lh5.googleusercontent.com/proxy/0diPJjN9qaBKIKjeTUrLa0xZe_U54nyoPCCgX06VT_jXy4aA2Dpxw4uBxvDXdAxQl5cR_rY3ehxQXpggIiusgS-IgDnR6KxuspMjsNH1ybaz7ioWvtwZZH_4OCZ8oQpeaGf5_VRMyR8pbeDTAev1qIePUCD6Vw=w433-h256-k-no'
      ]),
  TourismPlace(
      name: 'Fushimi Inari Taisha',
      location: "Kuil Shinto",
      decription: "Salah satu tempat wisata yang yang bagus banget",
      openDays: 'Everiday',
      openTime: '09.00 - 16.00',
      ticketPrice: 'Free',
      imageAsset: '',
      imageUrl: [
        'https://lh3.googleusercontent.com/p/AF1QipNKdHSpeIm6rHGdtXRByXdpb6hjLHRGf8S69_8z=s294-w294-h220-k-no'
      ]),
  TourismPlace(
      name: 'Menara Tokyo',
      location: "Dek Observasi",
      decription: "Salah satu tempat wisata yang yang bagus banget",
      openDays: 'Everiday',
      openTime: '09.00 - 16.00',
      ticketPrice: 'Free',
      imageAsset: '',
      imageUrl: [
        'https://lh3.googleusercontent.com/proxy/6h_KQFoBK4qYZ-yT-vIb_X72MtwjA_LbyqbNhP74tGMNtL-2Qgpef888bG-Bq7qUn8htshhK9VjtrTFakv_R-UmmM3l4cRtT-sVqBIBsownBS08mmEU3SaO68r0KKFn8T0NZt9mZcntq5J8fdqlHs7NxJK9ORA=s294-w294-h220-k-no'
      ]),
  TourismPlace(
      name: 'Universal Studios Jepang',
      location: "Jepang",
      decription: "Salah satu tempat wisata yang yang bagus banget",
      openDays: 'Everiday',
      openTime: '09.00 - 16.00',
      ticketPrice: 'Free',
      imageAsset: '',
      imageUrl: [
        'https://lh5.googleusercontent.com/proxy/0diPJjN9qaBKIKjeTUrLa0xZe_U54nyoPCCgX06VT_jXy4aA2Dpxw4uBxvDXdAxQl5cR_rY3ehxQXpggIiusgS-IgDnR6KxuspMjsNH1ybaz7ioWvtwZZH_4OCZ8oQpeaGf5_VRMyR8pbeDTAev1qIePUCD6Vw=w433-h256-k-no'
      ]),
];
