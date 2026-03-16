# Finly Database

Database schema, migrations, and seed data for the Finly application.

## Database

- PostgreSQL 16

## Structure

```
schema/          - Full database schema (for fresh installs)
migrations/      - Incremental migration scripts
seeds/           - Default data documentation
```

## Usage

### Fresh Install
```bash
psql $DATABASE_URL -f schema/001_initial_schema.sql
```

### Run Migrations
```bash
psql $DATABASE_URL -f migrations/001_add_repeat_columns.sql
psql $DATABASE_URL -f migrations/002_add_account_parent.sql
psql $DATABASE_URL -f migrations/003_add_goals_relations.sql
```
