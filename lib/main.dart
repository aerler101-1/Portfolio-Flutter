// Flutter portfolio app with extended timeline and contact details
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adam Erler Portfolio',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _sections = const [
    HomeSection(),
    AboutSection(),
    ProjectsSection(),
    TimelineSection(),
    ContactSection(),
  ];

  final List<String> _sectionTitles = ['Home', 'About', 'Projects', 'Timeline', 'Contact'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adam Erler'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_sectionTitles.length, (index) {
                final isSelected = _selectedIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected ? Colors.teal : Colors.grey[300],
                      foregroundColor: isSelected ? Colors.white : Colors.black,
                    ),
                    onPressed: () {
                      setState(() => _selectedIndex = index);
                    },
                    child: Text(_sectionTitles[index]),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: _sections[_selectedIndex],
          ),
        ],
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('self.png'),
            ),
            const SizedBox(height: 24),
            Text(
              "Hi, I'm Adam Erler",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 12),
            const Text(
              '',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            const Text(
              'I am a developer looking to make the world a better place for all humans through new technology frontiers.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final url = Uri.parse('https://aerler101-1.github.io/resume.pdf');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: const Text('Download Resume'),
            )
          ],
        ),
      ),
    );
  }
}





class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> highlightItems = [
      _AboutHighlight(
        icon: Icons.timeline,
        bigText: '11',
        smallText: 'Years experience',
      ),
      _AboutHighlight(
        icon: Icons.emoji_events,
        bigText: 'NWI Society of Innovators',
        smallText: 'Class of 2017',
      ),
      _AboutHighlight(
        icon: Icons.attach_money,
        bigText: 'Over \$100,000',
        smallText: 'In grants obtained',
      ),
      _AboutHighlight(
        icon: Icons.trending_up,
        bigText: 'Over 90% Increase',
        smallText: 'In research and database productivity',
      ),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Highlight Grid (Centered & Shrunk to 75% Width)
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                physics: const NeverScrollableScrollPhysics(),
                children: highlightItems,
              ),
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'I have 11 years of professional experience in the education and technology worlds. '
            'I am eager to do right by the world around me and find passion in projects that position groups and organizations to increase their positive footprint. '
            'I have partnered with human rights organizations to increase their productivity. I have worked to help process data for playground safety, and most recently, '
            'I am partnering with education data providers to help create effective visualizations for the classroom and school level. Outside of my work in the data field, '
            'I enjoy my free time with my family, watching horror movies with my wife, going to concerts for many of our favorite bands, and taking the pups and our baby girl on long hiking excursions.',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 24),
          const Text(
            'Skills: Python, R, SQL, JavaScript, Flutter/Dart',
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

class _AboutHighlight extends StatelessWidget {
  final IconData icon;
  final String bigText;
  final String smallText;

  const _AboutHighlight({
    required this.icon,
    required this.bigText,
    required this.smallText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.blueAccent),
            const SizedBox(height: 12),
            Text(
              bigText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              smallText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});
@override
Widget build(BuildContext context) {
  final projects = [
  {
    'title': 'GLAN: Web App',
    'desc': 'A full-stack app linking companies to human rights research.',
    'url': 'https://glan-35046b7f0ec4.herokuapp.com/',
    'image': 'assets/port_web.png'
  },
  {
    'title': 'GLAN: Data Processing',
    'desc': 'Data pipelines for research connections.',
    'url': 'https://github.com/aerler101-1/GLAN/tree/main',
    'image': 'assets/port1.jpg'
  },
  {
    'title': 'Civil Rights Dashboard',
    'desc': 'Streamlit dashboard analyzing OCR data.',
    'url': 'https://ocr-dashboard.streamlit.app/',
    'image': 'assets/port_ocr.png'
  }
];

  return ListView(
    padding: const EdgeInsets.all(32),
    children: projects
        .map((proj) => ListTile(
              leading: Image.network(
                proj['image']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                proj['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(proj['desc']!),
              onTap: () async {
                final url = Uri.parse(proj['url']!);
                if (await canLaunchUrl(url)) await launchUrl(url);
              },
            ))
        .toList(),
  );
}
}

class TimelineSection extends StatelessWidget {
  const TimelineSection({super.key});

  @override
  Widget build(BuildContext context) {
    final timeline = [
      {
        'year': '2023 - Present',
        'role': 'Data Analyst - Education Strategy Consulting',
        'details': 'Managed ELT pipelines in 5 states, automated Google API queries, optimized AWS databases.'
      },
      {
        'year': '2023 - Present',
        'role': 'Data Scientist - GLAN',
        'details': 'Built algorithms, NLP tools, LLM APIs, and full-stack tools for global research.'
      },
      {
        'year': '2018 - 2023',
        'role': 'STEM Educator - Horizon Science Academy',
        'details': 'Taught AP & college-level courses; wrote \$100K in grants; boosted test performance.'
      },
      {
        'year': '2014 - 2023',
        'role': 'QuarkNet Lead Teacher - Purdue University',
        'details': 'Organized annual Fermilab events, trained educators, honored for innovation.'
      },
      {
        'year': '2016 - 2018',
        'role': 'Data Engineer - SONAM Technologies',
        'details': 'Built SQL cloud systems, regression models for playground degradation.'
      },
      {
        'year': '2015 - 2019',
        'role': 'Lecturer - Purdue University NW',
        'details': 'Taught algebra, astronomy, physics labs.'
      },
      {
        'year': '2014 - 2018',
        'role': 'Math Teacher - Hammond Academy',
        'details': 'Developed top-2 ISTEP math program; raised \$30K for equipment.'
      }
    ];

    return ListView(
      padding: const EdgeInsets.all(32),
      children: timeline
          .map((item) => ListTile(
                leading: const Icon(Icons.work_outline),
                title: Text(item['role']!),
                subtitle: Text('${item['year']}\n${item['details']}'),
              ))
          .toList(),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          const Text(
            'Get in touch with me:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text('Email: adam.erler101@gmail.com'),
          const Text('Location: United States'),
          const SizedBox(height: 8),
          const Text('Education:'),
          const Text('BS. Math, Southern Illinois University'),
          const Text('MS. Math, Purdue University'),
          const Text('MS. Data Science, Bellevue University'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.link),
                onPressed: () async {
                  final url = Uri.parse('https://www.linkedin.com/in/adam-erler/');
                  if (await canLaunchUrl(url)) await launchUrl(url);
                },
              ),
              IconButton(
                icon: const Icon(Icons.code),
                onPressed: () async {
                  final url = Uri.parse('https://aerler101-1.github.io/');
                  if (await canLaunchUrl(url)) await launchUrl(url);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
