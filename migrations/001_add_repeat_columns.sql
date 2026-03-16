-- Migration: Add repeat columns to transactions
ALTER TABLE transactions ADD COLUMN IF NOT EXISTS repeat_group_id TEXT;
ALTER TABLE transactions ADD COLUMN IF NOT EXISTS repeat_end_date TEXT;
