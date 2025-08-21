import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/resume_data.dart';
import 'widgets/header_section.dart';
import 'widgets/summary_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/education_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/skills_section.dart';
import 'widgets/contact_section.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nelson Wong - Resume',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E3192), // Dark blue from LaTeX
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2E3192),
          ),
        ),
      ),
      home: const ResumeHomePage(),
    );
  }
}

class ResumeHomePage extends StatefulWidget {
  const ResumeHomePage({super.key});

  @override
  State<ResumeHomePage> createState() => _ResumeHomePageState();
}

class _ResumeHomePageState extends State<ResumeHomePage> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;

  final List<String> _sections = [
    'Home',
    'Experience',
    'Education',
    'Projects',
    'Skills',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Nelson Wong'),
        centerTitle: true,
        actions: [
          // Navigation menu for larger screens
          if (MediaQuery.of(context).size.width > 600)
            Row(
              children: _sections.asMap().entries.map((entry) {
                int index = entry.key;
                String section = entry.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextButton(
                    onPressed: () => _scrollToSection(index),
                    child: Text(
                      section,
                      style: TextStyle(
                        color: _currentIndex == index
                            ? const Color(0xFF2E3192)
                            : Colors.grey[600],
                        fontWeight: _currentIndex == index
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
        ],
      ),
      drawer: MediaQuery.of(context).size.width <= 600
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Color(0xFF2E3192),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Text(
                            ResumeData.personalInfo.name.split(' ').map((e) => e[0]).join(''),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2E3192),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          ResumeData.personalInfo.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ResumeData.personalInfo.title,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ..._sections.asMap().entries.map((entry) {
                    int index = entry.key;
                    String section = entry.value;
                    return ListTile(
                      title: Text(section),
                      selected: _currentIndex == index,
                      selectedTileColor: const Color(0xFF2E3192).withOpacity(0.1),
                      onTap: () {
                        _scrollToSection(index);
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeaderSection(
              personalInfo: ResumeData.personalInfo,
              onContactTap: (type) => _handleContactTap(type),
            ),
            SummarySection(summary: ResumeData.professionalSummary),
            ExperienceSection(experiences: ResumeData.workExperience),
            EducationSection(education: ResumeData.education),
            ProjectsSection(projects: ResumeData.projects),
            SkillsSection(skills: ResumeData.skills),
            ContactSection(
              personalInfo: ResumeData.personalInfo,
              onContactTap: (type) => _handleContactTap(type),
            ),
          ],
        ),
      ),
    );
  }

  void _scrollToSection(int index) {
    setState(() {
      _currentIndex = index;
    });
    
    // Calculate approximate scroll position based on section index
    double scrollPosition = index * 800.0; // Approximate height per section
    _scrollController.animateTo(
      scrollPosition,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _handleContactTap(String type) async {
    String url = '';
    switch (type) {
      case 'email':
        url = 'mailto:${ResumeData.personalInfo.email}';
        break;
      case 'phone':
        url = 'tel:${ResumeData.personalInfo.phone}';
        break;
      case 'github':
        url = 'https://github.com/${ResumeData.personalInfo.github}';
        break;
      case 'linkedin':
        url = 'https://linkedin.com/in/${ResumeData.personalInfo.linkedin}';
        break;
    }
    
    if (url.isNotEmpty) {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
