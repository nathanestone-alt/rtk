# RESUME - RTK native-fallback rollout handoff

**Updated:** 2026-08-14
**Status:** Native-fallback fix isolated, pushed, and installed locally. Dedup work was not carried forward.

## Completed

- Fetched both remotes and reviewed the two commits incoming to `feat/session-dedup`.
- Determined the useful change was the native-fallback fix; the dedup feature itself is considered frivolous and should not be continued.
- Rebased/isolate-applied the fallback behavior onto current `origin/develop`, removing all dedup-only `--session` dependencies.
- Created commit: `c1819ce fix(hook): strip RTK globals before native fallback`.
- Created and pushed `fix/native-fallback-current`, tracking `fork/fix/native-fallback-current`.
- PR URL: https://github.com/nathanestone-alt/rtk/pull/new/fix/native-fallback-current
- Branch scope is one commit touching only `src/main.rs`.
- `cargo fmt --all -- --check` and `git diff --check` passed.
- The focused test initially could not compile in the plain shell because ARM64 `ring` could not find `clang`.
- Built through the Visual Studio 2022 ARM64 environment and installed the fix locally.
- Installed executable: `C:\Users\natha\.cargo\bin\rtk.exe`.
- Live regression check passed:

  ```text
  rtk --ultra-compact grep -l "Rust Token Killer" README.md
  README.md
  FALLBACK_EXIT=0
  ```

## Important version caveat

The installed fix build reports `rtk 0.42.4` because that is the package version currently declared on the development branch. It replaced the previously installed `0.44.1` binary, but contains newer development code plus commit `c1819ce`.

No merge is required for local use. Merge/PR is only needed to land the fix in the shared repository.

## Running sessions

No session restart is required. Codex/Claude invoke `rtk.exe` separately for each command, so existing sessions use the replaced binary immediately.

## Repository/worktree state

Primary repository:

```text
C:\dev\projects\rtk
branch: feat/session-dedup
tracking: fork/feat/session-dedup
status: behind 2
```

Preserved user changes in the primary worktree:

```text
 M CLAUDE.md
?? RESUME.md
?? build-arm64.bat
?? cargo-arm64.bat
```

Do not reset, discard, or overwrite these files.

Fix worktree:

```text
C:\dev\projects\rtk\.worktrees\native-fallback-current
branch: fix/native-fallback-current
tracking: fork/fix/native-fallback-current
status: clean
```

The old dedup branches were intentionally left intact and recoverable; they were not deleted or merged.

## Suggested next action

If desired, open a PR from `fix/native-fallback-current`. Do not merge the dedup branch merely to obtain the fallback fix.

The context-mode knowledge base is preserved across `/clear`; use `ctx purge` only if explicitly requested.
