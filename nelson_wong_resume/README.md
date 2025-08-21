# Nelson Wong - Resume Website

A modern, responsive Flutter web application showcasing Nelson Wong's professional resume. Built with Flutter and hosted on Firebase.

## 🌟 Features

- **Modern UI/UX**: Clean, professional design with Material Design 3
- **Responsive Design**: Works seamlessly on desktop, tablet, and mobile devices
- **Interactive Navigation**: Smooth scrolling between sections
- **Contact Integration**: Direct links to email, phone, GitHub, and LinkedIn
- **Professional Sections**: 
  - Professional Summary
  - Work Experience with timeline
  - Education
  - Personal Projects with GitHub links
  - Skills organized by categories
  - Contact information and additional details

## 🚀 Live Demo

**Website**: https://nelson-resume.web.app

## 🛠️ Technology Stack

- **Frontend**: Flutter (Dart)
- **UI Framework**: Material Design 3
- **Typography**: Google Fonts (Inter)
- **Hosting**: Firebase Hosting
- **Icons**: Material Icons
- **URL Handling**: url_launcher

## 📱 Sections

1. **Header**: Personal information with contact buttons
2. **Professional Summary**: Overview of skills and experience
3. **Work Experience**: Detailed timeline of professional roles
4. **Education**: Academic background and achievements
5. **Personal Projects**: Showcase of technical projects with GitHub links
6. **Skills**: Categorized technical and soft skills
7. **Contact & Additional Info**: Languages, interests, and extracurricular activities

## 🏗️ Project Structure

```
lib/
├── main.dart                 # Main application entry point
├── models/
│   └── resume_data.dart      # Data models and resume content
└── widgets/
    ├── header_section.dart   # Header with personal info
    ├── summary_section.dart  # Professional summary
    ├── experience_section.dart # Work experience timeline
    ├── education_section.dart # Education details
    ├── projects_section.dart # Personal projects
    ├── skills_section.dart   # Skills display
    └── contact_section.dart  # Contact and additional info
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Firebase CLI
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd nelson_wong_resume
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run locally**
   ```bash
   flutter run -d chrome
   ```

4. **Build for web**
   ```bash
   flutter build web
   ```

### Deployment

1. **Initialize Firebase** (if not already done)
   ```bash
   firebase init hosting
   ```

2. **Deploy to Firebase**
   ```bash
   firebase deploy
   ```

## 🎨 Customization

### Updating Resume Content

Edit the `lib/models/resume_data.dart` file to update:
- Personal information
- Work experience
- Education
- Projects
- Skills
- Contact details

### Styling

- **Colors**: Update the color scheme in `main.dart` (currently using `#2E3192` as primary color)
- **Typography**: Modify Google Fonts in the theme configuration
- **Layout**: Adjust padding, margins, and spacing in individual widget files

## 📱 Responsive Design

The application is fully responsive and includes:
- **Desktop**: Full navigation menu in app bar
- **Mobile**: Drawer navigation with hamburger menu
- **Tablet**: Adaptive layout that works on medium screens

## 🔗 Contact Information

- **Email**: wkarweng@icloud.com
- **Phone**: 014-3246177
- **GitHub**: https://github.com/nelsonwong97
- **LinkedIn**: https://linkedin.com/in/wong-kar-weng-b53821223

## 📄 License

This project is for personal use and portfolio purposes.

## 🤝 Contributing

This is a personal resume website, but suggestions and improvements are welcome!

---

**Built with ❤️ using Flutter and Firebase**
