# Grizzly GBP Poster

Home-local Codex plugin support scripts for Grizzly Google Business Profile posts.

This plugin keeps the broad OneDrive photo library cloud/on-demand, extracts only usable electrical photos into the curated GBP folder, prepares spreadsheet rows for approval, posts approved rows, and archives used photos by month.

## Paths

- Raw intake: `C:\Users\carte\OneDrive\Media`
- Curated GBP folder: `C:\Users\carte\OneDrive\Media\Grizzly\GBP Post Photos`
- Archive: `C:\Users\carte\OneDrive\Media\Grizzly\GBP Post Photos\Archive\YYYY-MM`
- Workbook: `C:\Users\carte\OneDrive\Documents\Grizzly\Grizzly Business Documents\AI Management\Grizzly GBP 30-Day Schedule 2026-04-16.xlsx`

`C:\Users\carte\OneDrive\Phone Sync` is intentionally not used.

## First Setup

```powershell
cd C:\Users\carte\.codex\plugins\grizzly-gbp-poster
python scripts\grizzly_gbp.py init-config
```

Edit `config.local.json` and add API credentials when ready. Without credentials, the scanner, workbook preparation, schedule creation, and archive dry runs still work.

## Common Commands

```powershell
python scripts\grizzly_gbp.py scan-photos --dry-run
python scripts\grizzly_gbp.py create-month-schedule --month 2026-05 --days 30 --dry-run
python scripts\grizzly_gbp.py prepare-today --date 2026-05-01 --dry-run
python scripts\grizzly_gbp.py post-approved --date 2026-05-01 --all-due --dry-run
python scripts\grizzly_gbp.py archive-month --month 2026-05 --dry-run
```

When dry runs look good, remove `--dry-run`.

## Google Setup

Create an OAuth client in Google Cloud with the Google Business Profile APIs enabled, then run:

```powershell
python scripts\grizzly_gbp.py google-auth-url --client-id "..." --client-secret "..."
python scripts\grizzly_gbp.py google-auth-finish --code "code-from-browser"
```

The finish command stores the refresh token and tries to discover the first available account/location. If discovery picks the wrong one, rerun it with `--account-id` and `--location-id`.

## Approval Workflow

The plugin writes a draft caption and marks a row as `Needs approval`. It only posts when the row `Status` is `Approved`, `Posted` is not true, and required media/caption fields exist.

The daily task checks all approved, unposted rows dated on or before today, so a post approved after the morning draft is picked up on the next run.

## OneDrive Online-Only Cleanup

Month archive supports `--online-only`. It calls Windows `attrib +U -P` on archived files after metadata is written and verified. That keeps files in OneDrive/cloud storage while freeing local device storage.
