# 🏥 Sahayak (सहायक) — Digital Public Healthcare Platform

> **Empowering Grassroots Healthcare Workers, Streamlining Primary Health Centers, and Providing Real-Time Public Health Analytics.**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Node.js](https://img.shields.io/badge/Node.js-Express-339933?logo=node.js&logoColor=white)](https://nodejs.org)
[![MongoDB](https://img.shields.io/badge/MongoDB-Atlas-47A248?logo=mongodb&logoColor=white)](https://www.mongodb.com/)
[![License: ISC](https://img.shields.io/badge/License-ISC-blue.svg)](LICENSE)

---

## 📌 Project Overview

**Sahayak** is an end-to-end healthcare coordination platform purpose-built for India's public health ecosystem. It bridges the critical information gap between:

1. **ASHA Workers (Accredited Social Health Activists)**: Field workers conducting village surveys, immunization drives, maternal care, and rural health tracking.
2. **Primary Health Centers (PHCs)**: Doctors, supervisors, and medical officers managing village jurisdiction, drug inventories, and patient referrals.
3. **Health System Administrators (CMHO / District Authorities)**: Administrative executives monitoring coverage targets, allocating budgets, dispatching alerts, and viewing epidemiological trends.

---

## 🏗️ System Architecture & Role Hierarchies

```
                  ┌─────────────────────────────────────────┐
                  │    Health Administration (Admin)        │
                  │  - District Resource Allocation         │
                  │  - Real-time Epidemiological Analytics  │
                  │  - Broadcast Emergency Alerts           │
                  └────────────────────┬────────────────────┘
                                       │
                                       ▼
                  ┌─────────────────────────────────────────┐
                  │      Primary Health Centers (PHC)       │
                  │  - ASHA Worker Field Supervision        │
                  │  - Patient Registry & Critical Alerts   │
                  │  - Medicine Inventory Management        │
                  └────────────────────┬────────────────────┘
                                       │
                                       ▼
                  ┌─────────────────────────────────────────┐
                  │            ASHA Workers                 │
                  │  - Door-to-Door Household Surveys       │
                  │  - Child Immunization Tracking          │
                  │  - Antenatal & Postnatal Care Visits    │
                  └─────────────────────────────────────────┘
```

---

## 🚀 Key Features

### 1. Multi-Tier Authentication & Two-Stage Onboarding
- **Stage 1 (Identity)**: First Name, Last Name, Email, Phone Number, Password.
- **Stage 2 (Jurisdiction & Credentials)**:
  - **ASHA Workers**: ASHA ID, Assigned Village, PHC Center, Experience, Training Certifications.
  - **PHC Officers**: PHC ID, Facility Name, Sub-center, District, Staff Count, In-charge Doctor.
  - **Administrators**: Admin ID, Department (Maternal/Immunization/General), Jurisdiction District, Clearance.

### 2. Unified Flutter Client (Android, Web & Desktop)
- Dynamic host routing (`10.0.2.2` for Android Emulators, `localhost` for Web/Desktop).
- Consistent design system with responsive layouts and form validation.
- Direct routing to role-specific command centers upon authentication.

### 3. Resilient Node.js Backend & MongoDB Schema
- Token-based JWT authorization (`Bearer token`).
- Secure bcrypt password hashing with salt rounds.
- Normalized data models storing user accounts, role-specific metadata, and audit timestamps.

---

## 📂 Project Structure

```text
Sahayak_team/
├── backend/                       # Node.js + Express REST API
│   ├── src/
│   │   ├── controllers/           # Auth, ASHA, PHC, Admin controllers
│   │   ├── models/                # Mongoose schemas (User, ASHA, PHC, Admin)
│   │   ├── routes/                # Express API routes
│   │   ├── middlewares/           # JWT authentication middleware
│   │   └── utils/                 # Date parsing & helper utilities
│   ├── .env.example               # Template environment configuration
│   ├── package.json               # Backend dependencies and scripts
│   └── server.js                  # Application entry point
│
├── frontend/
│   └── app/                       # Flutter Application
│       ├── lib/
│       │   ├── constants/         # Color tokens & role strings
│       │   ├── services/          # HTTP AuthService & API integration
│       │   ├── utils/             # Field validators & formatters
│       │   ├── widgets/           # Reusable form inputs & cards
│       │   ├── screens/           # Auth, Onboarding & Dashboards
│       │   └── main.dart          # Flutter entry point
│       └── pubspec.yaml           # Flutter dependencies
│
├── .gitignore                     # Monorepo git ignore rules
└── README.md                      # Project documentation
```

---

## 🛠️ Getting Started

### Prerequisites
- **Node.js** (v18 or higher)
- **Flutter SDK** (v3.19 or higher)
- **MongoDB Atlas** account or local MongoDB instance

---

### Backend Setup

1. Navigate to the backend directory:
   ```bash
   cd backend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Create your `.env` file from `.env.example`:
   ```bash
   cp .env.example .env
   ```

4. Configure your `.env` variables:
   ```env
   MONGO_URL=mongodb+srv://<username>:<password>@cluster0.uznnd9p.mongodb.net/sahayak?retryWrites=true&w=majority
   JWT_SECRET=your_jwt_secret_key
   PORT=8000
   ```

5. Start the backend development server:
   ```bash
   npm run dev
   ```

---

### Frontend Setup

1. Navigate to the Flutter app directory:
   ```bash
   cd frontend/app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run on your desired target:
   - **Chrome (Web)**:
     ```bash
     flutter run -d chrome
     ```
   - **Android Emulator / Device**:
     ```bash
     flutter run
     ```
   - **Windows Desktop**:
     ```bash
     flutter run -d windows
     ```

---

## 📡 API Reference

| Method | Endpoint | Description | Auth Required |
|:---|:---|:---|:---:|
| `GET` | `/` | Health check & connection probe | No |
| `POST` | `/api/v1/auth/register` | Stage-1 user registration | No |
| `POST` | `/api/v1/auth/login` | User login (returns JWT & role) | No |
| `POST` | `/api/v1/asha/register` | Stage-2 ASHA profile submission | Yes |
| `POST` | `/api/v1/phc/register` | Stage-2 PHC profile submission | Yes |
| `POST` | `/api/v1/admin/register` | Stage-2 Admin profile submission | Yes |
| `GET` | `/api/v1/auth/profile` | Current user profile | Yes |

---

## 🔒 Security & Best Practices

- **Never commit `.env`**: Always keep production credentials and secrets in local `.env` files (ignored in `.gitignore`). Use `.env.example` for reference.
- **Passwords**: Salted and hashed using `bcrypt` before database persistence.
- **Cross-Origin**: CORS enabled for local development with Flutter Web and Mobile.

---

## 👥 Contributors

- **Team Sahayak** — Building digital solutions for grassroots healthcare.
