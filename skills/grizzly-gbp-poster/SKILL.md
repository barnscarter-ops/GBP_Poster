---
name: grizzly-gbp-poster
description: Manage Grizzly Google Business Profile posting workflow: scan OneDrive photos for usable electrical images, prepare workbook rows, post approved GBP updates, and archive used photos to OneDrive online-only storage.
---

# Grizzly GBP Poster

Use this skill when working on Grizzly Google Business Profile post scheduling, OneDrive photo intake, GBP post workbook automation, Supabase media upload, or monthly GBP photo archiving.

Important paths:
- Plugin root: `C:\Users\carte\.codex\plugins\grizzly-gbp-poster`
- Raw photo intake: `C:\Users\carte\OneDrive\Media`
- Curated post photos: `C:\Users\carte\OneDrive\Media\Grizzly\GBP Post Photos`
- Workbook: `C:\Users\carte\OneDrive\Documents\Grizzly\Grizzly Business Documents\AI Management\Grizzly GBP 30-Day Schedule 2026-04-16.xlsx`

Never use `C:\Users\carte\OneDrive\Phone Sync` for this workflow.

Primary script:

```powershell
python C:\Users\carte\.codex\plugins\grizzly-gbp-poster\scripts\grizzly_gbp.py --help
```

Prefer `--dry-run` before moving files, writing workbook rows, posting to GBP, or marking files online-only.
