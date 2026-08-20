# Contributing to DEKIO

Thanks for your interest in contributing! Please follow these steps.

## Branching Strategy

- `main` — stable, production-ready code only
- `develop` — active integration branch; all feature work merges here first

## Workflow

1. Fork the repository
2. Branch off `develop` (not `main`):
   git checkout develop
   git pull origin develop
   git checkout -b feature/your-feature-name
3. Commit your changes: git commit -m "feat: add feature description"
4. Push your branch: git push origin feature/your-feature-name
5. Open a Pull Request **targeting `develop`** (not `main`) referencing the related issue (e.g. "Closes #1")

## Branch Naming Convention

- feature/* — New features
- bugfix/* — Bug fixes
- docs/* — Documentation updates
- refactor/* — Code refactoring

## Commit Message Format

feat: Add user registration
fix: Fix login validation bug
docs: Update API documentation
refactor: Optimize database queries

## Documentation Principle

Project status must always clearly distinguish:
- Completed — working and tested
- In Development — currently being built
- Planned — not started

No feature should be documented as completed before it actually works.

## Code of Conduct

Be respectful, constructive, and collaborative. This is a shared learning and building space.
