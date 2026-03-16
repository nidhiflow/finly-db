-- Migration: Add parent_id to accounts for sub-accounts
ALTER TABLE accounts ADD COLUMN IF NOT EXISTS parent_id TEXT REFERENCES accounts(id) ON DELETE CASCADE;
