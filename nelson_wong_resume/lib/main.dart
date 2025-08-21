import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
          seedColor: const Color(0xFF2E3192),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.interTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          titleTextStyle: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2E3192),
          ),
          iconTheme: const IconThemeData(
            color: Color(0xFF2E3192),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            shadowColor: const Color(0xFF2E3192).withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
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

class _ResumeHomePageState extends State<ResumeHomePage>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final List<String> _sections = [
    'Home',
    'Experience',
    'Education',
    'Projects',
    'Skills',
    'Contact',
  ];

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    // Start animations
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFC),
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: AnimatedBuilder(
        animation: _fadeAnimation,
        builder: (context, child) {
          return Opacity(
            opacity: _fadeAnimation.value,
            child: const Text('Nelson Wong'),
          );
        },
      ),
      centerTitle: true,
      actions: [
        if (MediaQuery.of(context).size.width > 600)
          AnimatedBuilder(
            animation: _fadeAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeAnimation.value,
                child: Row(
                  children: _sections.asMap().entries.map((entry) {
                    int index = entry.key;
                    String section = entry.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: _buildNavButton(index, section),
                    );
                  }).toList(),
                ),
              );
            },
          ),
      ],
    );
  }

  Widget _buildNavButton(int index, String section) {
    bool isActive = _currentIndex == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive 
            ? const Color(0xFF2E3192).withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: isActive
            ? Border.all(color: const Color(0xFF2E3192), width: 1)
            : null,
      ),
      child: TextButton(
        onPressed: () => _scrollToSection(index),
        style: TextButton.styleFrom(
          foregroundColor: isActive
              ? const Color(0xFF2E3192)
              : Colors.grey[600],
          padding: EdgeInsets.zero,
        ),
        child: Text(
          section,
          style: GoogleFonts.inter(
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget? _buildDrawer() {
    if (MediaQuery.of(context).size.width > 600) return null;
    
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2E3192),
              Color(0xFF1BFFFF),
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildDrawerHeader(),
            ..._sections.asMap().entries.map((entry) {
              int index = entry.key;
              String section = entry.value;
              return _buildDrawerItem(index, section);
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: const Color(0xFF2E3192),
              child: Text(
                ResumeData.personalInfo.name.split(' ').map((e) => e[0]).join(''),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            ResumeData.personalInfo.name,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            ResumeData.personalInfo.title,
            style: GoogleFonts.inter(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(int index, String section) {
    bool isActive = _currentIndex == index;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? Colors.white.withOpacity(0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          section,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        leading: Icon(
          _getSectionIcon(section),
          color: Colors.white,
          size: 20,
        ),
        onTap: () {
          _scrollToSection(index);
          Navigator.pop(context);
        },
      ),
    );
  }

  IconData _getSectionIcon(String section) {
    switch (section) {
      case 'Home':
        return Icons.home;
      case 'Experience':
        return Icons.work;
      case 'Education':
        return Icons.school;
      case 'Projects':
        return Icons.code;
      case 'Skills':
        return Icons.psychology;
      case 'Contact':
        return Icons.contact_mail;
      default:
        return Icons.circle;
    }
  }

  Widget _buildBody() {
    return AnimationLimiter(
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 600),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(child: widget),
            ),
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
      ),
    );
  }

  void _scrollToSection(int index) {
    setState(() {
      _currentIndex = index;
    });
    
    // Calculate approximate scroll position based on section index
    double scrollPosition = index * 800.0;
    _scrollController.animateTo(
      scrollPosition,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
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
}
