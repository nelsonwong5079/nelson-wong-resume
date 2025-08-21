import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/resume_data.dart';

class ContactSection extends StatelessWidget {
  final PersonalInfo personalInfo;
  final Function(String) onContactTap;

  const ContactSection({
    super.key,
    required this.personalInfo,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFF2E3192),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(2),
                    bottomRight: Radius.circular(2),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'Contact & Additional Info',
                style: GoogleFonts.inter(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2E3192),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          
          // Contact Information
          _buildInfoSection('Contact Information', [
            _buildInfoRow(Icons.email, 'Email', personalInfo.email, () => onContactTap('email')),
            _buildInfoRow(Icons.phone, 'Phone', personalInfo.phone, () => onContactTap('phone')),
            _buildInfoRow(Icons.location_on, 'Address', personalInfo.address, null),
            _buildInfoRow(Icons.link, 'GitHub', personalInfo.github, () => onContactTap('github')),
            _buildInfoRow(Icons.work, 'LinkedIn', personalInfo.linkedin, () => onContactTap('linkedin')),
          ]),
          
          const SizedBox(height: 24),
          
          // Languages
          _buildInfoSection('Languages', [
            ...ResumeData.languages.map((lang) => _buildInfoRow(Icons.language, '', lang, null)),
          ]),
          
          const SizedBox(height: 24),
          
          // Interests
          _buildInfoSection('Interests', [
            ...ResumeData.interests.map((interest) => _buildInfoRow(Icons.favorite, '', interest, null)),
          ]),
          
          const SizedBox(height: 24),
          
          // Extra Curricular
          if (ResumeData.extraCurricular.isNotEmpty)
            _buildInfoSection('Extra-Curricular Activities', [
              ...ResumeData.extraCurricular.map((activity) => _buildInfoRow(Icons.star, '', activity, null)),
            ]),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2E3192),
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value, VoidCallback? onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFF2E3192),
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (label.isNotEmpty) ...[
                  Text(
                    label,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    value,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: onTap != null ? const Color(0xFF2E3192) : Colors.grey[800],
                      decoration: onTap != null ? TextDecoration.underline : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 