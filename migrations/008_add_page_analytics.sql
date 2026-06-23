-- Migration 008: Add page analytics tracking table
-- Tracks which pages/screens users visit for admin analytics

CREATE TABLE IF NOT EXISTS page_analytics (
    id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    page TEXT NOT NULL,
    visited_at TIMESTAMP DEFAULT NOW()
);

-- Indexes for fast admin queries
CREATE INDEX IF NOT EXISTS idx_page_analytics_page       ON page_analytics(page);
CREATE INDEX IF NOT EXISTS idx_page_analytics_user_id   ON page_analytics(user_id);
CREATE INDEX IF NOT EXISTS idx_page_analytics_visited_at ON page_analytics(visited_at);
