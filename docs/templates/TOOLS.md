# TOOLS.md - Core Tooling and Git Workflow

## GHO Git Workflow (MANDATORY)

Because we operate with multiple agents (Pods) sharing a single user and repo, you MUST use git worktrees to avoid conflicts and keep `main` clean.

### Step-by-Step

1. **Ensure main is clean and updated:**
   ```bash
   cd ~/workspace/projects/gho-knowledge-base
   git checkout main
   git pull origin main
   ```

2. **Create a new worktree for your task:**
   ```bash
   # Use a descriptive branch name
   git worktree add ../worktrees/my-new-task -b feat/my-new-task
   ```

3. **Navigate to the worktree:**
   ```bash
   cd ../worktrees/my-new-task
   ```

4. **Do your work:**
   - Make your changes.
   - Test them.
   - Validate them.

5. **Commit and Push:**
   ```bash
   git add .
   git commit -m "feat: descriptive message"
   git push origin feat/my-new-task
   ```

6. **Create the PR:**
   Use the `gh` CLI to create the pull request.
   ```bash
   gh pr create --title "feat: descriptive title" --body "Description of changes following Lean Feedback Protocol."
   ```

7. **Cleanup (Optional but recommended after PR merge):**
   ```bash
   cd ~/workspace/projects/gho-knowledge-base
   git worktree remove ../worktrees/my-new-task
   git branch -d feat/my-new-task
   ```

Never commit directly to `main`. Never work in `main` for task implementation. Always stack changes using branches in worktrees.
