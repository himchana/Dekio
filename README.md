# DEKIO
> A digital platform connecting customers with trusted cleaning-service providers for homes, offices, and businesses.

<div align="center">

[![Status](https://img.shields.io/badge/Status-Foundation%20Development-blue)](#development-status)
[![Version](https://img.shields.io/badge/Version-1.0-green)](https://github.com/himchana/dekio/releases)
[![License](https://img.shields.io/badge/License-MIT-yellow)](LICENSE)
[![Repo](https://img.shields.io/badge/Repo-github.com%2Fhimchana%2Fdekio-blue)](https://github.com/himchana/dekio)

</div>

---

## Table of Contents

- [Overview](#overview)
- [Problem Statement](#problem-statement)
- [Proposed Solution](#proposed-solution)
- [Vision & Mission](#vision--mission)
- [Target Users](#target-users)
- [Features](#features)
- [User Journeys](#user-journeys)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [API Endpoints (Planned)](#api-endpoints-planned)
- [Development Roadmap](#development-roadmap)
- [Development Status](#development-status)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

**DEKIO** is a planned digital platform that will connect customers with cleaning-service providers. The platform will make it easier for customers to find, compare, request, and manage cleaning services while helping providers reach and manage customers digitally.

**Discover → Choose → Book → Manage → Review**

---

## Problem Statement

Finding reliable cleaning services can be difficult because customers often depend on:

- Personal recommendations
- Phone calls
- Social media
- Informal contacts

This makes it difficult to know which providers are available, along with their services, prices, and quality. Providers also have limited ways to reach and manage customers digitally.

---

## Proposed Solution

DEKIO will provide **one platform** where:

### Customers can:
Discover → Choose → Request/Book → Manage → Review

### Providers can:
Register → Create Profile → Add Services → Receive Bookings → Manage Services

---

## Vision & Mission

### Vision
To become a trusted digital platform for accessing and managing cleaning services.

### Mission
To simplify access to cleaning services while creating better digital opportunities for service providers.

---

## Target Users

| User Type | Description |
|-----------|-------------|
| Customers | People looking for cleaning services for homes, offices, businesses, and other locations. |
| Service Providers | Individuals or businesses offering cleaning services. |
| Administrators | People responsible for managing and monitoring the platform. |

---

## Features

The following features are planned and will be implemented progressively:

### Core Features
- User registration and login
- Customer profiles
- Provider profiles
- Service listings
- Service discovery
- Booking system
- Booking management
- Reviews and ratings

### Advanced Features
- Notifications
- Administration dashboard
- Payment integration
- Location-based services

---

## User Journeys

### Customer Journey
Register → Login → Browse Services → Choose Service → View Provider → Book Service → Track Booking → Review Provider

### Provider Journey
Register → Create Profile → Add Services → Receive Booking → Manage Booking → Complete Service

---

## Tech Stack

| Layer | Planned Technology |
|-------|-------------------|
| Frontend | Flutter / Web Client Layer |
| Backend | Python + FastAPI |
| Database | PostgreSQL |
| ORM | SQLAlchemy |
| Migrations | Alembic |
| API | REST |
| Version Control | Git + GitHub |

> Technology choices may change as development progresses.

---

## Project Structure

```
DEKIO/
│
├── backend/                # FastAPI backend
│   ├── app/
│   │   ├── api/             # API endpoints
│   │   ├── core/             # Core configuration
│   │   ├── models/           # Database models
│   │   ├── schemas/          # Pydantic schemas
│   │   ├── services/         # Business logic
│   │   └── utils/            # Utility functions
│   ├── migrations/          # Alembic migrations
│   ├── tests/                # Backend tests
│   ├── requirements.txt
│   └── .env.example
│
├── frontend/                # Flutter / Web client
│   ├── lib/
│   ├── assets/
│   ├── test/
│   └── pubspec.yaml
│
├── docs/
│   └── DEKIO_DOCUMENTATION.md
│
├── README.md
├── .env.example
├── .gitignore
└── LICENSE
```

---

## Getting Started

### Prerequisites

- Python 3.9+
- PostgreSQL 14+
- Git
- Flutter SDK (for mobile development)

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/himchana/dekio.git
cd dekio

# 2. Set up backend
cd backend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt

# 3. Set up environment variables
cp .env.example .env
# Edit .env with your database credentials and secrets

# 4. Set up database
alembic upgrade head

# 5. Run backend server
uvicorn app.main:app --reload

# 6. Set up frontend (in a new terminal)
cd ../frontend
flutter pub get
flutter run
```

### Environment Variables

Create a `.env` file with the following:

```env
# Database
DATABASE_URL=postgresql://user:password@localhost/dekio_db

# Security
SECRET_KEY=your-secret-key-here
ACCESS_TOKEN_EXPIRE_MINUTES=30

# App Settings
APP_NAME=DEKIO
APP_ENV=development
DEBUG=True
```

---

## API Endpoints (Planned)

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/auth/register` | User registration |
| POST | `/api/auth/login` | User login |
| GET | `/api/users/me` | Get current user profile |
| GET | `/api/services` | List all services |
| POST | `/api/services` | Create a new service |
| GET | `/api/bookings` | List user bookings |
| POST | `/api/bookings` | Create a new booking |

> These are planned endpoints and are not yet implemented.

---

## Development Roadmap

### Phase 1 — Planning (Complete)
- [x] Define requirements
- [x] Define user journeys
- [x] Design system architecture
- [x] Design database
- [x] Design UI/UX

### Phase 2 — Foundation (In Progress)
- [ ] Set up GitHub repository
- [ ] Set up frontend
- [ ] Set up backend
- [ ] Set up database
- [ ] Configure development environment

### Phase 3 — Core Features
- [ ] Authentication
- [ ] User profiles
- [ ] Services
- [ ] Provider management
- [ ] Booking system

### Phase 4 — Advanced Features
- [ ] Reviews
- [ ] Notifications
- [ ] Payments
- [ ] Location services
- [ ] Admin dashboard

### Phase 5 — Testing & Deployment
- [ ] Testing
- [ ] Security review
- [ ] Performance testing
- [ ] Production deployment
- [ ] Monitoring

---

## Development Status

| Component | Status |
|-----------|--------|
| Project Planning | [x] Completed |
| UI/UX Design | [x] Completed |
| Frontend | [ ] Not Started |
| Backend | [ ] Not Started |
| Database | [ ] Not Started |
| Authentication | [ ] Not Started |
| Services | [ ] Not Started |
| Booking | [ ] Not Started |
| Reviews | [ ] Not Started |
| Payments | [ ] Not Started |
| Notifications | [ ] Not Started |
| Testing | [ ] Not Started |
| Deployment | [ ] Not Started |

---

## Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature-name`
3. Commit your changes: `git commit -m "Add feature description"`
4. Push to the branch: `git push origin feature/your-feature-name`
5. Open a Pull Request

### Branch Naming Convention
- `feature/*` - New features
- `bugfix/*` - Bug fixes
- `docs/*` - Documentation updates
- `refactor/*` - Code refactoring

### Commit Message Format
```
feat: Add user registration
fix: Fix login validation bug
docs: Update API documentation
refactor: Optimize database queries
```

### Documentation Principle
This document will be updated throughout development. The project status must always clearly distinguish:
- ☑ Completed — working and tested
- □ In Development — currently being built
- □ Planned — not started

No feature should be documented as completed before it actually works.

---

## Security

Security will be considered from the beginning of development. Planned security practices include:

- Password hashing
- Authentication & Authorization
- Role-based access control
- Input validation
- Secure environment variables
- Protected API endpoints
- Secure database access

---

## Future Possibilities

DEKIO may later include:

- Mobile applications (iOS & Android)
- Web platform
- Online payments
- GPS-based provider discovery
- Real-time notifications
- AI-powered recommendations
- Provider verification
- Analytics
- Business accounts
- Multi-location services

---


---

## Contributing

Contributions make this project more impactful. Here's how to get involved:

1. Fork the project
2. Create your feature branch
   ```bash
   git checkout -b feature/Feature-Name
   ```
3. Commit your changes
   ```bash
   git commit -m 'Add Feature-Name'
   ```
4. Push to the branch
   ```bash
   git push origin feature/Feature-Name
   ```
5. Open a Pull Request

---


## License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## Contact

**Project Lead:** Sameer Mutabuzi

**Email:** kalebuchana@gmail.com

**Repository:** [github.com/himchana/dekio](https://github.com/himchana/dekio)

---


**MEMBERS**
* Kalebu Chana
* Omari Sengulo

  <h2 align="center">
  DEKIO
  <br>
  <span style="color: rgba(107, 114, 128, 0.5);">|</span>
  <span style="color: #ffffff;">Discover</span>
  <span style="color: rgba(107, 114, 128, 0.5);">|</span>
  <span style="color: #ffffff;">Book</span>
  <span style="color: rgba(107, 114, 128, 0.5);">|</span>
  <span style="color: #ffffff;">Clean</span>
</h2>

<h3 align="center"> Built by the DEKIO Team </h3>
