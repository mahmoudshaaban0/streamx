class NewsItem {
  final int id;
  final String title;
  final String imgUrl;
  final String category;
  final String author;
  final String time;
  final bool isFavorite;

  NewsItem({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.category,
    required this.author,
    this.isFavorite = false,
    this.time = '8 minutes ago',
  });

  NewsItem copyWith({
    int? id,
    String? title,
    String? imgUrl,
    String? category,
    String? author,
    String? time,
    bool? isFavorite,
  }) {
    return NewsItem(
      id: id ?? this.id,
      title: title ?? this.title,
      imgUrl: imgUrl ?? this.imgUrl,
      category: category ?? this.category,
      author: author ?? this.author,
      time: time ?? this.time,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

List<NewsItem> news = [
  NewsItem(
    id: 1,
    title: 'This is a freaking title here',
    imgUrl:
        'https://deadline.com/wp-content/uploads/2023/12/2024-a-look-ahead.jpg?w=1280&h=720&crop=1',
    category: 'Sports',
    author: 'CNN',
  ),
  NewsItem(
    id: 2,
    title: 'This is a very good title here',
    imgUrl:
        'https://film-authority.com/wp-content/uploads/2024/03/RDHS_2024_DigitalOneSheet_JakeChair_1944x2880_PRE_NoDimple_PV_FINAL_en-US_CPS.jpg',
    category: 'Social',
    author: 'BBC',
  ),
  NewsItem(
    id: 3,
    title: 'This is an amazing title here',
    imgUrl:
        'https://occ-0-2794-2219.1.nflxso.net/dnm/api/v6/Qs00mKCpRvrkl3HZAN5KwEL1kpE/AAAABepf9edTvCH-NdiTRbwewk9cevGjQrtfRRtJe4IVSWQAyU4iI1FLeuSsD-jPQy7LbxPWrkXPh7Jlq2pKCeElFRIhFNhspEWbd128u8wogEgwJzSHfoEVg4if3Qie8hHMzSM7Lw.webp?r=1ff',
    category: 'Medical',
    author: 'National',
  ),
  NewsItem(
    id: 4,
    title: 'This is an excellent title here',
    imgUrl:
        'https://images.immediate.co.uk/production/volatile/sites/3/2020/03/ELITE_S3_240919_MFVC_023-7d57180-scaled.jpg?quality=90&resize=980,654',
    category: 'Political',
    author: 'CNN',
  ),
];
