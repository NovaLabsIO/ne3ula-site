# NE3ULA Core — Build Workflow

This document defines the development and deployment workflow for the NE3ULA core website.

It exists so that development can resume easily across:
- different machines
- different development sessions
- AI collaborators
- human collaborators

---

# 1. Repository Location

Local repo path:

/Users/atk/Documents/NE3ULA_db/ne3ula.com/ne3ula-core

Remote repository:

https://github.com/NovaLabsIO/ne3ula-core

---

# 2. Deployment Architecture

The deployment stack is:

Local Development  
↓  
Git Commit  
↓  
GitHub Repository  
↓  
Cloudflare Pages  
↓  
ne3ula.com live site  

Cloudflare Pages is connected directly to the GitHub repository.

When commits are pushed to the `main` branch, Cloudflare automatically builds and deploys the site.

---

# 3. Development Workflow

Always begin development by navigating to the repo:

```bash
cd ~/Documents/NE3ULA_db/ne3ula.com/ne3ula-core
```

Pull the latest version of the repo:

```bash
git pull origin main
```

Make changes to files.

Then commit and push:

```bash
git add .
git commit -m "describe changes"
git push
```

Cloudflare will automatically trigger a new deployment.

---

# 4. Verify Deployment

After pushing changes:

1. Open the Cloudflare Pages dashboard.
2. Look for a new deployment tied to the latest commit.
3. Wait for the build to complete.
4. Visit the deployed site to confirm changes.

---

# 5. Repository Structure

```
ne3ula-core
│
├── index.html
├── home/
├── myth/
├── music/
├── axzio/
├── begin/
├── e3/
├── engine/
├── lore/
│
├── assets/
│
├── shared/
│ └── styles.css
│
├── SOURCE_OF_TRUTH.md
├── BUILD_WORKFLOW.md
│
└── _archive/
```

---

# 6. Page Development Guidelines

Follow the architecture defined in:

SOURCE_OF_TRUTH.md

Do not restructure page hierarchy unless intentionally redesigning the site architecture.

---

# 7. Styling System

Global styles live in:

```
/shared/styles.css
```

All pages should use this stylesheet.

Avoid duplicating CSS across pages.

---

# 8. Adding New Pages

When adding new pages:

1. Create a folder with an `index.html`.
2. Ensure navigation links are updated.
3. Maintain consistent styling.
4. Follow the architecture defined in SOURCE_OF_TRUTH.md.

Example:

```
/axzio/reflect/index.html
```

---

# 9. Common Commands

Check repo status:

```bash
git status
```

View commit history:

```bash
git log --oneline
```

Pull latest changes:

```bash
git pull origin main
```

Push updates:

```bash
git push
```

---

# 10. Troubleshooting

## Problem: Not in Git Repository

If terminal shows:

```
fatal: not a git repository
```

You are likely in the wrong folder.

Navigate to the repo:

```bash
cd ~/Documents/NE3ULA_db/ne3ula.com/ne3ula-core
```

Confirm:

```bash
git status
```

---

## Problem: GitHub Token Expired

If `git push` fails with:

```
remote: Invalid username or token
fatal: Authentication failed
```

Your GitHub Personal Access Token has likely expired.

### Step 1 — Remove old credential from macOS Keychain

Open **Keychain Access**.

Search for:

```
github.com
```

Delete any entries named:

```
github.com
git:https://github.com
```

---

### Step 2 — Create a new GitHub Personal Access Token

Open:

https://github.com/settings/tokens

Click:

Generate new token → Generate new token (classic)

Settings:

Name:

```
NE3ULA Git Push
```

Expiration:

```
90 days (or preferred duration)
```

Scopes:

```
repo
workflow
```

Generate the token and copy it.

---

### Step 3 — Retry the push

Run:

```bash
git push
```

When prompted:

Username:

```
NovaLabsIO
```

Password:

Paste the new GitHub Personal Access Token.

(macOS will store it in Keychain automatically)

---

### Step 4 — Verify success

You should see:

```
To https://github.com/NovaLabsIO/ne3ula-core.git
```

Cloudflare Pages will then automatically trigger a new deployment.

---

# 11. Resuming Development in a New Session

When starting a new development session:

1. Open terminal.
2. Navigate to the repo:

```bash
cd ~/Documents/NE3ULA_db/ne3ula.com/ne3ula-core
```

3. Pull the latest repo state:

```bash
git pull origin main
```

4. Review project architecture:

```
SOURCE_OF_TRUTH.md
```

5. Begin development.

---

End of document.