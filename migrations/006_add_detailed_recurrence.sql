ALTER TABLE transactions 
  ADD COLUMN IF NOT EXISTS repeat_interval INTEGER,
  ADD COLUMN IF NOT EXISTS repeat_day_of_month INTEGER,
  ADD COLUMN IF NOT EXISTS next_due_date TEXT,
  ADD COLUMN IF NOT EXISTS repeat_end_type TEXT,
  ADD COLUMN IF NOT EXISTS repeat_occurrences_total INTEGER,
  ADD COLUMN IF NOT EXISTS repeat_occurrences_current INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS auto_create BOOLEAN DEFAULT true,
  ADD COLUMN IF NOT EXISTS reminder_days_before INTEGER,
  ADD COLUMN IF NOT EXISTS status TEXT DEFAULT 'active';
