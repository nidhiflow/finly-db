-- Migration: Add category_id and account_id to savings_goals
ALTER TABLE savings_goals ADD COLUMN IF NOT EXISTS category_id TEXT REFERENCES categories(id) ON DELETE SET NULL;
ALTER TABLE savings_goals ADD COLUMN IF NOT EXISTS account_id TEXT REFERENCES accounts(id) ON DELETE SET NULL;
