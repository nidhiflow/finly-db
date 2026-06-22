-- Migration: Add repeat_frequency column to transactions
ALTER TABLE transactions ADD COLUMN IF NOT EXISTS repeat_frequency TEXT;
