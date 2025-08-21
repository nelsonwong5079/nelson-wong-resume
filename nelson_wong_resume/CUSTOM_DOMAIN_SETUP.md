# Custom Domain Setup Guide

## Current Status ✅

Your resume is now deployed to: **https://nelson-resume.web.app**

## Setting Up a Completely Custom Domain (Optional)

If you want to use your own domain (e.g., `nelson-resume.com`), follow these steps:

### 1. Purchase a Domain
- Buy a domain from providers like:
  - Google Domains
  - Namecheap
  - GoDaddy
  - Cloudflare

### 2. Add Custom Domain to Firebase

```bash
# Add your custom domain
firebase hosting:sites:add your-custom-domain

# Update firebase.json to use the new site
```

### 3. Update firebase.json
```json
{
  "hosting": {
    "site": "your-custom-domain",
    "public": "build/web",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**"
    ],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ]
  }
}
```

### 4. Configure DNS Records

Firebase will provide you with DNS records to add to your domain provider:

- **A Record**: Point to Firebase IP addresses
- **CNAME Record**: Point www subdomain to your Firebase site

### 5. Verify Domain Ownership

```bash
# Firebase will provide verification instructions
firebase hosting:sites:list
```

### 6. Deploy to Custom Domain

```bash
flutter build web
firebase deploy
```

## Current Configuration

Your resume is currently configured to use:
- **Site ID**: `nelson-resume`
- **URL**: https://nelson-resume.web.app
- **Project**: codapay-webhook

## Quick Commands

```bash
# Deploy to current custom domain
./deploy.sh

# View all available sites
firebase hosting:sites:list

# Switch to a different site
firebase use --add
```

## Benefits of Custom Domain

1. **Professional Branding**: Use your own domain name
2. **SEO Benefits**: Better search engine optimization
3. **Brand Recognition**: Easier to remember and share
4. **Portability**: Can move hosting without changing URLs

---

**Current Live URL**: https://nelson-resume.web.app 