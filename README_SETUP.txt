ORBIT WORKSPACE — CONFIGURED FOR YOUR SUPABASE PROJECT
=====================================================

YOUR PROJECT SETTINGS (already entered in index.html)
- Supabase project: my-habits
- Project reference: ixrfrkqicikvqdkljlvl
- Project URL: https://ixrfrkqicikvqdkljlvl.supabase.co
- Data API REST base: https://ixrfrkqicikvqdkljlvl.supabase.co/rest/v1/
- Browser key: your supplied sb_publishable_... key (publishable key only)
- Data API: your screenshot shows it enabled.

FILES
- index.html: ORBIT app configured for the Supabase project above.
- supabase_setup.sql: reference/setup SQL for the ORBIT table and RLS policies.

DATABASE ALREADY CREATED?
You said you have already pasted and run the database SQL. If it completed successfully,
DO NOT run it again just for this update. The application expects this table:
  public.orbit_workspaces
with columns:
  user_id (uuid), data (jsonb), updated_at (timestamptz)

To verify, open Supabase Dashboard > Database > Tables and check that
public.orbit_workspaces exists. If it exists, continue to Authentication settings below.
If it does not exist, or the SQL Editor showed an error, open supabase_setup.sql,
paste it into SQL Editor > New query, and run it once.

FINAL SUPABASE AUTH SETTINGS
1. Open Authentication > URL Configuration.
2. Set Site URL to the exact public URL where you deploy ORBIT.
3. Add that same URL to Redirect URLs. If you use a local development server,
   add its exact URL too (for example http://localhost:5500/**).
4. Under Authentication > Providers > Email, make sure Email is enabled.
5. Deploy this package's index.html to your web host, replacing the old index.html.
6. Open the site over HTTPS, create an account, confirm the email if confirmation
   is enabled, then sign in.

SECURITY
- The supplied publishable key is intended for browser use. It is included in index.html.
- Never place a Supabase service_role key or secret key in HTML or browser JavaScript.
- Row Level Security (RLS) must remain enabled on public.orbit_workspaces.
- The SQL policies restrict each signed-in user to the row where user_id = auth.uid().
- Supabase Auth handles passwords; the app does not store passwords in its workspace JSON.

FEATURES IN THIS VERSION
- Supabase Auth signup, sign-in, sign-out and password-reset email.
- Cloud workspace save/load for cross-device access.
- One-time migration of old ORBIT browser data when signing in on the same browser
  and website origin where the old local version was used.
- SMART goals with success measure, current/target values, relevance, action plan,
  due date and progress.
- Academic course details, semester summaries, indicative GPA/classification
  and CSV transcript export.
- Browser notifications for tasks due today or overdue.
- Existing tasks, budget planner, profile, theme, JSON backup/import and budget
  spreadsheet tools.

NOTES
- Password-reset email delivery depends on Supabase email/SMTP configuration and
  allowed redirect URLs.
- Browser reminders require notification permission and the ORBIT tab to remain open.
  They are not server-side scheduled emails or push notifications.
- GPA conversion is indicative; use your institution's official grading scale if different.
- Old local records migrate only from the same browser/origin. Otherwise import your
  old JSON backup after signing in.
- The supplied screenshots confirm the project reference, publishable-key section,
  API URL and that Data API is switched on. They do not independently prove that the
  ORBIT table or RLS policies exist; verify public.orbit_workspaces in Database > Tables.
