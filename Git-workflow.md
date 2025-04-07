# 📚 Project Git Workflow Guide

Welcome to the official Git workflow template for this repository. This guide ensures a consistent, clean, and collaborative development experience across this team and repo.

Please follow the standards below to keep our codebase stable, reviewable, and production-ready.

---

## 🚦 Branching Strategy

We use a **Git Feature Branch Workflow** built on top of a `main` and `dev` branch model.

- `main` – Production-ready code only (deployable at all times)
- `dev` – Integration branch where features are merged and tested
- `feature/<short-description>` – Branch for individual tasks or features
- `bugfix/<short-description>` – Branch for fixing issues/bugs
- `hotfix/<short-description>` – For urgent patches directly from `main`
- `chore/<short-description>` – For non-feature tasks (e.g., formatting, dependencies)

---

## 🌱 Creating a Feature Branch

Before starting work, always **pull the latest changes** from `dev` and then create your branch:

```bash
git checkout dev
git pull origin dev
git checkout -b feature/<your-feature-name>
```

✅ Use clear, lowercase, hyphenated names (e.g., `feature/login-page`, `bugfix/api-error`)

---

## 💾 Committing Changes

Make small, meaningful commits with consistent formatting:

```bash
git add .
git commit -m "feat(login): implement user login form"
```

Recommended commit prefixes:

- `feat`: new feature
- `fix`: bug fix
- `docs`: documentation update
- `style`: formatting, missing semi colons, etc.
- `refactor`: code restructuring, no behaviour change
- `test`: adding tests
- `chore`: maintenance

---

## 🔁 Syncing Your Branch (Always Do Before PR)

```bash
git checkout dev
git pull origin dev
git checkout feature/<your-feature-name>
git rebase dev
```

If there are conflicts, resolve them manually and continue the rebase:

```bash
git add .
git rebase --continue
```

Then push your updated branch:

```bash
git push -f origin feature/<your-feature-name>
```

---

## 🚀 Making a Pull Request (PR)

1. Go to the repo on GitHub
2. Create a **PR from your `feature/*` branch to `dev`**
3. Add a clear **title** and **description**
4. Link related issues (if applicable)
5. Assign reviewers (usually team lead + 1 peer)
6. Ensure all checks pass (CI, tests, etc.)

---

## ✅ Pull Request Checklist

Before requesting a review:

- [ ] All code is committed and pushed
- [ ] Code is tested and working locally
- [ ] The branch is rebased on the latest `dev`
- [ ] The PR has a clear title and description
- [ ] CI/CD pipelines pass
- [ ] No unnecessary files (e.g., `.env`, logs, build artifacts)

---

## 🔀 Merging Pull Requests

Only **reviewers or team leads** should merge PRs after approval.

### Merge Strategy: **Squash and Merge**

- Keeps history clean
- Allows concise, descriptive commit messages

---

## 🔄 Updating Your Local `dev` and `main` Branches

```bash
git checkout dev
git pull origin dev

git checkout main
git pull origin main
```

Do this often to stay up-to-date.

---

## 🛑 Do NOT

- ❌ Push directly to `main` or `dev`
- ❌ Merge without a PR
- ❌ Commit large chunks of unrelated code
- ❌ Leave unresolved conflicts in PRs

---

## 💬 Team Collaboration Tips

- Communicate blockers early
- Review others' PRs regularly
- Ask for feedback before big changes
- Document your decisions in the PR

---

## 📌 Summary Diagram (Git Workflow)

```text
feature/*  →  dev  →  main

[ you ] -----------┐
                   ├─> PR → dev → approval → squash merge
[ team lead ] <----┘             ↓
                            release → main
```

---

By following this shared Git workflow, we ensure consistent development practices, clean collaboration, and a smoother path from code to production.

Let’s build together – the right way! 🚀
