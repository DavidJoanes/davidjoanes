import 'package:flutter/material.dart';
import 'package:flutter_devicon/flutter_devicon.dart';
import 'package:get/get.dart';

class Constants extends GetxController {
  // App version
  String appVersion = "1.0.5";
  // Colors
  Map<int, Color> defaultColor = {
    50: const Color(0xFFCCFFCC),
    100: const Color(0xFF99FF99),
    200: const Color(0xFF7FFF7F),
    300: const Color(0xFF4CFF4C),
    400: const Color(0xFF32FF32),
    500: const Color(0xFF00FF00),
    600: const Color(0xFF00CC00),
    700: const Color(0xFF009900),
    800: const Color(0xFF006600),
    900: const Color(0xFF003300),
    1000: const Color(0xFF003300),
  };

  var navBarItemColor = Colors.grey;
  var primaryColor = const Color(0xFF00FF00);
  var primaryColor2 = const Color(0xFF4CFF4C);
  var transparentColor = const Color.fromARGB(0, 255, 255, 255);
  var transparentColor2 = const Color.fromARGB(210, 0, 0, 0);
  var whiteColor = Colors.white;
  var whiteColor2 = const Color.fromARGB(133, 248, 248, 248);
  var blackColor = Colors.black;
  var blackColor2 = const Color.fromARGB(255, 87, 87, 87);
  var blackColor3 = const Color.fromARGB(144, 51, 48, 48);
  var greyColor = Colors.grey;

  // Temporal values
  String email = "davidkemdirim@gmail.com";
  String aboutMe =
      """I am an enthusiastic Software Developer and Network Engineer with over 3 years and 1 year experience in Software development and Network engineering respectively.\n\nI specialize in building robust software applications and restful API for web, mobile and desktop applications.\n\nWhen I'm not building software applications, I'm often found configuring network devices such as Routers, Switches, etc.. as well as debugging and resolving issues that may arise in a company's network.
                            """;

  String experienceBrief =
      """Since 2019, I've had the priviledge to work with some amazing Organizations and Institutions, of which I contributed to cutting-edge projects that has pushed the boundaries of telecommunication and renewable energy technology.\nI'll forever cherish the memories that I have with these oraganizations, that have enriched my expertise and deepend my passion for the ever-evolving tech landscape.""";

  var experience1 = {
    "huawei": [
      "Network Engineer (Intern)",
      "#Huawei Technologies",
      "June, 2023 - Till date",
      "https://www.huawei.com"
    ],
    "acecore": [
      "Chief Software Engineer (Part-time)",
      "#Acecore Incorporations",
      "Mar, 2022 - Till date",
      "https://acecore.tech"
    ],
    "cite": [
      "IT Assistant / Instructor",
      "#Centre for Information and Telecommunication Engineering",
      "June, 2020 - Dec, 2021",
      "https://citeuniport.com"
    ],
    "huawei2": [
      "Intern",
      "#Huawei Technologies, Shenzhen",
      "Oct, 2019 - Nov, 2019",
      "https://www.huawei.com"
    ],
  };

  var experience2 = {
    "huawei": [
      [
        const Icon(
          Icons.double_arrow_sharp,
          color: Color(0xFF00FF00),
        ),
        "Configuration of network devices."
      ],
      [
        const Icon(
          Icons.double_arrow_sharp,
        ),
        "Debugging and resolution of faults on customers network."
      ],
      [
        const Icon(
          Icons.double_arrow_sharp,
        ),
        "Escalation of faults I'm unable to resolve to senior Technical Assistants."
      ],
      [
        const Icon(
          Icons.double_arrow_sharp,
        ),
        "Cabling of various network devices within data center."
      ],
    ],
    "acecore": [
      [
        const Icon(
          Icons.double_arrow_sharp,
          color: Color(0xFF00FF00),
        ),
        "Building and maintenace of her cross-platform application that interfaces with her Powercell."
      ],
      [
        const Icon(
          Icons.double_arrow_sharp,
        ),
        "Contributed in the hardware development of her Powercell."
      ],
      [
        const Icon(
          Icons.double_arrow_sharp,
        ),
        "Created Restful API for the company's cross-platform applications."
      ],
    ],
    "cite": [
      [
        const Icon(
          Icons.double_arrow_sharp,
          color: Color(0xFF00FF00),
        ),
        "As a certified Huawei Academy Instructor, I instructed over 900 students in various Huawei professional courses (like HCIA-Datacom, HCIA-Routing and Switching), of which a little of 500 are currently Certified by Huawei Technologies."
      ],
      [
        const Icon(
          Icons.double_arrow_sharp,
        ),
        "As a Software Developer, I instructed over 100 students on programming and data analysis using Python programming language."
      ],
    ],
    "huawei2": [
      [
        const Icon(
          Icons.double_arrow_sharp,
          color: Color(0xFF00FF00),
        ),
        "Configuration of 4G and 5G databases"
      ]
    ]
  };

  String myProductsBrief =
      """Have a glance at some of my finest products completed and still in development.""";

  var myProductsImage = [
    [
      "assets/images/projects/bbj/1.jpg",
      "assets/images/projects/bbj/2.jpg",
      "assets/images/projects/bbj/3.jpg",
      "assets/images/projects/bbj/4.jpg",
      "assets/images/projects/bbj/5.jpg",
      "assets/images/projects/bbj/6.jpg",
    ],
    [
      "assets/images/projects/powercore/1.png",
      "assets/images/projects/powercore/2.png",
      "assets/images/projects/powercore/3.png",
    ],
    [
      "assets/images/projects/peculyn/1.png",
      "assets/images/projects/peculyn/2.png",
      "assets/images/projects/peculyn/3.png",
      "assets/images/projects/peculyn/4.png",
      "assets/images/projects/peculyn/5.png",
    ],
    [
      "assets/images/projects/sirenjournals/1.png",
      "assets/images/projects/sirenjournals/2.png",
      "assets/images/projects/sirenjournals/3.png",
      "assets/images/projects/sirenjournals/4.png",
    ],
    [
      "assets/images/projects/jogenicsHMS/1.png",
      "assets/images/projects/jogenicsHMS/2.png",
      "assets/images/projects/jogenicsHMS/3.png",
      "assets/images/projects/jogenicsHMS/4.png",
      "assets/images/projects/jogenicsHMS/5.png",
      "assets/images/projects/jogenicsHMS/6.png",
    ],
    [
      "assets/images/projects/sar/1.png",
      "assets/images/projects/sar/2.png",
      "assets/images/projects/sar/3.png",
      "assets/images/projects/sar/4.png",
      "assets/images/projects/sar/5.png",
    ],
  ];

  var myProducts = [
    [
      "Bole by Joanes",
      "Bole by Joanes is a web application built for my business that entails the production and delivery of Port Harcourt's finest meal (Bole) to customer doorstep.\nIt can be used by customers, dispatchers as well as the admin (via the admin page).",
      "https://bolebyjoanes.netlify.app"
    ],
    [
      "PowerCore",
      "Powercore is the official mobile application of Acecore Incorporation, that enables her customers interface with their product (Powercell) to seamlessly manage and analyze energy consumption in customer's home.",
      "https://acecore.tech"
    ],
    [
      "Peculyn",
      "Peculyn is an e-Commerce web application which I collaborated in building for a client. It aids in the sales of products by users to their respective target audience.",
      "https://perculyn.com"
    ],
    [
      "Siren Journals",
      "Siren Journals is a web application that serves as a platform for users who intend to publish school journals.",
      "https://sirenjournals.net"
    ],
    [
      "Jogenics Hotel Management System",
      """Jogenics Hotel Management System is a high-end desktop application that runs on Windows operating system. It was built to assist owners, managers and staff of hotels efficiently perform their individual jobs in ensuring the smooth running of the hotel.\n
It provides priviledges to the owners of hotel to accurately monitor the activities of thier employees in real-time, analyze and obtain daily, monthly and yearly income of the hotel without the need for a third party software. On the other hand, it assits the emplyees (Bartenders and Receptionists) to efficiently carry out sales and check-in/out guests respectively.""",
      "https://github.com/DavidJoanes/jogenics"
    ],
    [
      "Smart Attendance Register",
      "Smart Attendance register is a software that assists colleges and institution of learning in efficiently recording or registering daily attendance of students and staff via facial recognition.\nThis was basically one of the mini projects I carried out during my final year in college.",
      "https://github.com/DavidJoanes/"
    ],
  ];

  String toolsIUseBrief =
      "Below are some of the tools and technologies I make use of in developing various projects.";

  var toolsIUse = [
    [
      IconButton(
        icon: Image.asset("assets/icons/javascript.png"),
        onPressed: () {},
      ),
      "Javascript",
    ],
    [
      IconButton(
        icon: Image.asset("assets/icons/nodejs.png"),
        onPressed: () {},
      ),
      "NodeJS",
    ],
    [
      IconButton(
        icon: Image.asset("assets/icons/python.png"),
        onPressed: () {},
      ),
      "Python",
    ],
    [
      IconButton(
        icon: Image.asset("assets/icons/django.png"),
        onPressed: () {},
      ),
      "Django",
    ],
    [
      IconButton(
        icon: Image.asset("assets/icons/flask.png"),
        onPressed: () {},
      ),
      "Flask",
    ],
    [
      IconButton(
        icon: Image.asset("assets/icons/dart.png"),
        onPressed: () {},
      ),
      "Dart",
    ],
    [
      const Icon(FlutterDEVICON.flutter_plain, color: Colors.lightBlue),
      "Flutter",
    ],
    [
      const Icon(FlutterDEVICON.mongodb_plain, color: Colors.green),
      "MongoDb",
    ],
    [
      IconButton(
        icon: Image.asset("assets/icons/firebase.png"),
        onPressed: () {},
      ),
      "Firebase",
    ],
    [
      const Icon(FlutterDEVICON.mysql_plain, color: Colors.teal),
      "MySql",
    ],
    [
      const Icon(FlutterDEVICON.mongodb_plain_wordmark, color: Colors.green),
      "Mongoose",
    ],
    [
      IconButton(
        icon: Image.asset("assets/icons/aws.png"),
        onPressed: () {},
      ),
      "AWS",
    ],
    [
      IconButton(
        icon: Image.asset("assets/icons/cloudinary.png"),
        onPressed: () {},
      ),
      "Cloudinary",
    ],
    [
      IconButton(
        icon: Image.asset("assets/icons/github.png"),
        onPressed: () {},
      ),
      "Github",
    ],
    [
      IconButton(
        icon: Image.asset("assets/icons/railway.png"),
        onPressed: () {},
      ),
      "Railway",
    ],
    [
      IconButton(
        icon: Image.asset("assets/icons/cyclic.png"),
        onPressed: () {},
      ),
      "Cyclic",
    ],
    [
      IconButton(
        icon: Image.asset("assets/icons/netlify.png"),
        onPressed: () {},
      ),
      "Netlify",
    ],
    [
      IconButton(
        icon: Image.asset("assets/icons/git.png"),
        onPressed: () {},
      ),
      "Git",
    ],
  ];

  String certificatesBrief =
      "Here are a couple of my professional certifications.";

  var certificates = [
    [
      "assets/images/certificates/ai.png",
      "Huawei Certified ICT Associate - AI"
    ],
    [
      "assets/images/certificates/storage.png",
      "Huawei Certified ICT Associate - Storage"
    ],
    [
      "assets/images/certificates/datacom.png",
      "Huawei Certified ICT Associate - Datacom"
    ],
    ["assets/images/certificates/bigdata.png", "Cerified Big Data Analyst"],
  ];

  String connectWithMe =
      "Ofcourse, I have a life outside coding.. lol\nAt my free time, I watch or play football, visit the cinema, watch NatGeoWild, and definetly play some board games especially Monopoly!!\n\nWanna connect? Feel free to reach out to me via any of the platforms below.";

  late var myHandles = [
    [
      const Icon(FlutterDEVICON.github_original),
      "https://github.com/DavidJoanes/",
    ],
    [
      const Icon(FlutterDEVICON.twitter_original, color: Colors.lightBlue),
      "https://twitter.com/call_me_joanes?s=09",
    ],
    [
      const Icon(FlutterDEVICON.linkedin_plain, color: Colors.blue),
      "https://www.linkedin.com/in/david-kemdirim-019813155",
    ],
    [
      Image.asset("assets/icons/mail.png"),
      "mailto:$email?",
    ],
  ];
}
