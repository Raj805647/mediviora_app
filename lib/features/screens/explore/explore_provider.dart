import 'package:base_module/base_module.dart';

class ExploreProvider extends BaseProvider{
  final categories = [
    {
      "title": "Cardiology",
      "emoji": "❤️",
      "count": "245 Hospitals",
      "hot": true,
    },
    {
      "title": "Orthopedics",
      "emoji": "🦴",
      "count": "189 Hospitals",
      "hot": false,
    },
    {
      "title": "Oncology",
      "emoji": "🎗️",
      "count": "156 Hospitals",
      "hot": true,
    },
    {
      "title": "Neurology",
      "emoji": "🧠",
      "count": "134 Hospitals",
      "hot": false,
    },
    {
      "title": "Dental Care",
      "emoji": "🦷",
      "count": "298 Hospitals",
      "hot": false,
    },
    {
      "title": "Eye Care",
      "emoji": "👁️",
      "count": "167 Hospitals",
      "hot": true,
    },
  ];

  final destinations = [
    {
      "country": "Thailand",
      "flag": "🇹🇭",
      "hospital": "324 Hospitals",
      "save": "40-60%",
    },
    {
      "country": "India",
      "flag": "🇮🇳",
      "hospital": "892 Hospitals",
      "save": "50-70%",
    },
    {
      "country": "Singapore",
      "flag": "🇸🇬",
      "hospital": "156 Hospitals",
      "save": "30-50%",
    },
    {
      "country": "UAE",
      "flag": "🇦🇪",
      "hospital": "234 Hospitals",
      "save": "25-45%",
    },
  ];

}