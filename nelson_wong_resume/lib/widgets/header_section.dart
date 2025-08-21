import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/resume_data.dart';

class HeaderSection extends StatelessWidget {
  final PersonalInfo personalInfo;
  final Function(String) onContactTap;

  const HeaderSection({
    super.key,
    required this.personalInfo,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Profile Avatar
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white,
              child: Text(
                personalInfo.name.split(' ').map((e) => e[0]).join(''),
                style: GoogleFonts.inter(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2E3192),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Name and Title
            Text(
              personalInfo.name,
              style: GoogleFonts.inter(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              personalInfo.title,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.9),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            
            // Address
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    personalInfo.address,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            // Contact Buttons
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                _buildContactButton(
                  icon: Icons.email,
                  label: 'Email',
                  onTap: () => onContactTap('email'),
                ),
                _buildContactButton(
                  icon: Icons.phone,
                  label: 'Phone',
                  onTap: () => onContactTap('phone'),
                ),
                _buildContactButton(
                  icon: Icons.link,
                  label: 'GitHub',
                  onTap: () => onContactTap('github'),
                ),
                _buildContactButton(
                  icon: Icons.work,
                  label: 'LinkedIn',
                  onTap: () => onContactTap('linkedin'),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildContactButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF2E3192),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 2,
      ),
    );
  }
} 