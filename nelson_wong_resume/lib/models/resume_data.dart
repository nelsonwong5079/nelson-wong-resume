class ResumeData {
  static const PersonalInfo personalInfo = PersonalInfo(
    name: 'Wong Kar Weng',
    title: 'Payment Enablement Specialist',
    address: 'No. 33, 2/13 Jalan Sungai Besi Indah, Taman Sungai Besi Indah, 43300, Selangor, Malaysia',
    phone: '014-3246177',
    email: 'wkarweng@icloud.com',
    github: 'nelsonwong97',
    linkedin: 'wong-kar-weng-b53821223',
  );

  static const String professionalSummary = '''
Payment Enablement Specialist with a strong foundation in software engineering and full-stack development. 
Extensive experience in API integration, automation, and internal tool development within the fintech and payments industry, 
with prior engineering roles at BlueOceanIT and Silverlake focusing on enterprise solutions across logistics and finance domains. 
Proven ability to deliver impactful automation tools (Codapay Simulator, Payout Internal Tool, Sandbox Monitoring System), 
optimize payment channel performance, and support global publisher integrations while ensuring compliance and operational reliability. 
Skilled in bridging business, product, and engineering teams to accelerate delivery and enhance client onboarding experiences.
''';

  static const List<WorkExperience> workExperience = [
    WorkExperience(
      title: 'Payment Enablement Specialist',
      company: 'Codapay',
      period: '01/2024 - Present',
      location: '',
      achievements: [
        'Integration Ownership: Led pre- and post-integration support across Codapay\'s Payin, Payout, Direct Card (complex API), Refund, and Tokenized APIs, ensuring seamless publisher go-live experiences.',
        'Conversion Rate Optimization: Conducted CR analysis on payment channels across different transaction layers. Partnered with Product and Engineering teams to propose enhancements that boosted channel performance.',
        'Client Engagement: Partnered with global publishers across EU, Southeast Asia, and China; attended offsite meetings in Shanghai to gather requirements, resolve issues, and provide tailored integration solutions.',
        'Payment Channel Communication: Acted as main liaison with payment channel providers, troubleshooting technical and operational issues, coordinating fixes, and ensuring uninterrupted service continuity.',
        'Documentation & Developer Tools: Authored and maintained API documentation, flowcharts, sequence diagrams, and Postman collections. Delivered technical guides on signature validation, error handling, and JWT generation in Java.',
        'Operational Support: Generated API keys for merchants, supported sandbox/production testing, and ensured readiness for UAT and live launches.',
        'Compliance & KYC: Supported payout operations by addressing compliance issues raised by providers/regulators. Performed KYC checks and supplied documentation to ensure transactions remained compliant and successful.',
        'Automation & Efficiency: Built automation workflows using Zapier to connect Slack and Jira, enabling automated alerts, reminders, and triggers to improve efficiency and reduce manual workload.',
        'Sandbox Monitoring Automation (Project Lead): Built a web-based dashboard to automate Payin API sandbox checks, validate responses, and display real-time results. Added scheduled health checks (9AM & 1PM SGT) with alert emails, cutting manual effort by 95%.',
        'Codapay Simulator (Project Lead): Developed a Flutter-based internal simulator (Android/iOS) replicating Codapay\'s WebView and Airtime APIs. Included API key management, webhook integration, Airtime exerciser, and multilingual UI, reducing engineering dependency in troubleshooting and integrations.',
        'Fraud Monitoring: Conducted transaction analysis to identify suspicious activity, collaborated with the Fraud team, and flagged potential risks with supporting data.',
        'VIP Client Handling: Managed strategic integrations for high-value publishers in the live-streaming sector (e.g., Bigo, Vshow, Hago), ensuring stability and fast issue resolution.',
        'Leadership & Mentorship: Onboarded newcomers, interviewed candidates, and provided training to improve team capacity and maintain integration quality.',
        'Tech Stack in Practice: Applied SQL and Metabase for CR/payment analysis, Postman for API testing/automation, Python for debugging, Flutter for internal tool development, and Java for backend integration and JWT flows.',
      ],
    ),
    WorkExperience(
      title: 'Project Leader / Full Stack Developer',
      company: 'BlueOceanIT Sdn Bhd, Malaysia',
      period: '11/2021 - 03/2023',
      location: '',
      achievements: [
        'Led enterprise project lifecycles, from requirements gathering to delivery, across logistics and finance domains.',
        'Designed ERDs, managed databases, and implemented stored procedures to optimize system performance.',
        'Delivered UI and backend services for DHL\'s logistics platform using Angular and SQL.',
        'Managed UAT and customer support, ensuring positive client feedback and smooth handover.',
      ],
    ),
    WorkExperience(
      title: 'Software Engineer',
      company: 'Silverlake Group, Malaysia',
      period: '02/2021 - 10/2021',
      location: '',
      achievements: [
        'Developed and maintained enterprise banking solutions including core modules for transaction processing and reporting.',
        'Enhanced system reliability by implementing optimized SQL queries and debugging critical financial workflows.',
        'Collaborated with cross-functional teams to deliver software updates aligned with banking compliance and security standards.',
      ],
    ),
    WorkExperience(
      title: 'Software Engineer Intern',
      company: 'BlueOceanIT Sdn Bhd, Malaysia',
      period: '10/2020 - 01/2021',
      location: '',
      achievements: [
        'Built new system features using JavaScript, Python, and Django.',
        'Designed registration and onboarding workflows for new users.',
        'Conducted debugging and wrote test scripts to validate backend functionality.',
      ],
    ),
  ];

  static const List<Education> education = [
    Education(
      degree: 'B.Sc. (Hons) Software Engineering with Merit',
      institution: 'University Tunku Abdul Rahman (UTAR)',
      period: '10/2018 - 10/2021',
      gpa: 'GPA: 3.33',
    ),
    Education(
      degree: 'Foundation in Science',
      institution: 'University Tunku Abdul Rahman (UTAR)',
      period: '05/2017 - 05/2018',
      gpa: 'GPA: 3.22',
    ),
    Education(
      degree: 'Sijil Pelajaran Malaysia (SPM)',
      institution: '',
      period: '01/2016',
      gpa: '',
    ),
  ];

  static const List<Project> projects = [
    Project(
      name: 'Codapay Simulator',
      company: 'Coda Payments (Initiated and Owned Development)',
      year: '2025',
      githubLink: 'https://github.com/nelsonwong5079/codapay_simulator',
      description: [
        'Built a Flutter-based app (Android/iOS) simulating Codapay WebView payment flows and Airtime APIs.',
        'Integrated Firebase Auth & Firestore for secure API key management and access control.',
        'Designed a configurable WebView tester to replicate browser vs in-app behaviors and debug issues effectively.',
        'Implemented Airtime API exerciser (v1.0 & v2.0) with complete end-to-end flows (init → purchase → validation).',
        'Added structured transaction logging, auto-clearing local storage, and webhook integration.',
        'Delivered a clean iOS-inspired UI, dark mode, and multilingual support (English & Mandarin).',
        'Tech stack: Flutter (Dart), Firebase (Auth, Firestore, Functions), Provider, REST API, WebView.',
      ],
    ),
    Project(
      name: 'Payout Internal Tool',
      company: 'Coda Payments',
      year: '2025',
      githubLink: 'https://github.com/nelsonwong5079/payout-internal-tool',
      description: [
        'Designed and implemented an internal tool to automate payout sandbox operations, evolving from a Python script to a production-ready web version.',
        'Python Script (v1): Automated transaction status updates, webhook notifications, payout report generation, and encrypted email dispatch. Reduced manual processing from ~2 hours to 5 minutes.',
        'Web Version (v2): Migrated into a browser-accessible tool with clean UI/UX, requiring no setup. Expanded to cover full sandbox workflows.',
        'Hosted at payout-tool.web.app, ensuring easy adoption across internal teams.',
        'Reduced handling time further to ~2 minutes, cutting dependency on Support and Engineering teams.',
        'Tech stack: Python (Flask/FastAPI, Pandas), HTML/CSS/JavaScript, Firebase Hosting, JWT & HMAC signing, SMTP/CSV automation.',
      ],
    ),
    Project(
      name: 'Sandbox Monitoring System',
      company: 'Coda Payments (Initiated and Owned Development)',
      year: '2025',
      githubLink: 'https://github.com/nelsonwong5079/payout-internal-tool',
      description: [
        'Developed a web-based monitoring dashboard for Codapay\'s Payin sandbox environments, eliminating manual Postman checks.',
        'Automated API health checks, validating responses and displaying results in a real-time metrics dashboard.',
        'Embedded the payment page in an iframe view, enabling instant validation.',
        'Scheduled health checks at 9AM and 1PM SGT daily, with automated email alerts on errors.',
        'Reduced manual monitoring effort by 95%.',
        'Tech stack: Python (Flask), HTML/CSS/JavaScript, Cron scheduling, SMTP email alerts, API automation.',
      ],
    ),
    Project(
      name: 'Chinese Dialects Translator',
      company: 'University Tunku Abdul Rahman (UTAR)',
      year: '2021',
      githubLink: '',
      description: [
        'Developed a React Native app to translate between Hakka, Cantonese, and Mandarin.',
        'Integrated audio pronunciation features for spoken learning.',
        'Used Firebase real-time database to handle translations and user data.',
      ],
    ),
  ];

  static const Map<String, List<String>> skills = {
    'API & Integration': [
      'RESTful APIs',
      'Payment APIs (Payin, Payout, Direct Card, Refund, Tokenized)',
      'Postman',
      'WebView Flows',
      'JWT Authentication',
      'Signature Validation',
      'Error Handling'
    ],
    'Automation': [
      'Zapier Workflows',
      'Internal Tooling',
      'Python scripting for debugging & efficiency'
    ],
    'Data/Analysis': [
      'SQL (Athena/Metabase)',
      'Transaction Data Analysis',
      'Conversion Rate Optimization',
      'Fraud Detection & Monitoring'
    ],
    'Documentation': [
      'API Documentation',
      'Flowcharts',
      'Sequence Diagrams',
      'Developer Guides',
      'Knowledge Base Articles'
    ],
    'Programming': [
      'Flutter (Dart)',
      '.NET (C#)',
      'Angular',
      'SQL',
      'TypeScript',
      'Python',
      'Django',
      'React Native',
      'HTML/CSS',
      'JavaScript',
      'Java'
    ],
    'Tools': [
      'Postman',
      'Metabase',
      'Git',
      'Firebase',
      'Jira',
      'Confluence',
      'Slack Automation'
    ],
    'Soft Skills': [
      'Leadership & Mentorship',
      'Cross-Functional Collaboration',
      'Stakeholder Communication',
      'Client Engagement (EU, SEA, China)',
      'Compliance/KYC Handling'
    ],
    'Other': [
      'Software Testing',
      'UAT Management',
      'Payment Channel Analysis',
      'Fast Learner'
    ],
  };

  static const List<String> languages = [
    'English - Full Professional Proficiency',
    'Mandarin - Full Professional Proficiency',
    'Bahasa Melayu - Professional Working Proficiency',
  ];

  static const List<String> interests = [
    'Sports, Movies, Coding, Travel',
    'Explorations in Crypto & Web3: Early participant in NFT-based Web3 gaming (e.g., CryptoMines). Gained exposure to tokenomics, smart contract mechanics, and lifecycle of crypto projects.',
    'Hands-on with Crypto Platforms: Experienced with Binance, Biswap, and Bybit for trading, pool mining, staking, and yield optimization.',
  ];

  static const List<String> extraCurricular = [
    'Study Tour Programme in Busan (Korea) - Enhanced cultural awareness, adaptability, and personal development.',
  ];
}

class PersonalInfo {
  final String name;
  final String title;
  final String address;
  final String phone;
  final String email;
  final String github;
  final String linkedin;

  const PersonalInfo({
    required this.name,
    required this.title,
    required this.address,
    required this.phone,
    required this.email,
    required this.github,
    required this.linkedin,
  });
}

class WorkExperience {
  final String title;
  final String company;
  final String period;
  final String location;
  final List<String> achievements;

  const WorkExperience({
    required this.title,
    required this.company,
    required this.period,
    required this.location,
    required this.achievements,
  });
}

class Education {
  final String degree;
  final String institution;
  final String period;
  final String gpa;

  const Education({
    required this.degree,
    required this.institution,
    required this.period,
    required this.gpa,
  });
}

class Project {
  final String name;
  final String company;
  final String year;
  final String githubLink;
  final List<String> description;

  const Project({
    required this.name,
    required this.company,
    required this.year,
    required this.githubLink,
    required this.description,
  });
} 