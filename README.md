<h1 align="center">🗄️ Finly Database</h1>

<p align="center">
  <strong>📐 PostgreSQL schema, migrations, and seed data for the Finly application</strong>
</p>

<p align="center">
  <a href="https://github.com/nidhiflow/finly-frontend">🖥️ Frontend Repo</a> •
  <a href="https://github.com/nidhiflow/finly-backend">⚙️ Backend Repo</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/PostgreSQL-16-4169E1?logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/Neon-Serverless-00E5A0?logo=neon&logoColor=white" />
  <img src="https://img.shields.io/badge/License-Private-red" />
</p>

---

## 📖 About

This repository is the **single source of truth** for the Finly application's database. It contains the full schema definition, incremental migration scripts, and documentation of default seed data.

---

## 📁 Repository Structure

```
finly-db/
├── schema/
│   └── 001_initial_schema.sql       # 🏗️ Complete database schema
├── migrations/
│   ├── 001_add_repeat_columns.sql   # 🔄 Add recurring transaction support
│   ├── 002_add_account_parent.sql   # 🏦 Add sub-account hierarchy
│   └── 003_add_goals_relations.sql  # 🎯 Link goals to categories & accounts
├── seeds/
│   └── default_categories.sql       # 📋 Default expense & income categories
└── README.md
```

---

## 🏗️ Database Schema

### 📊 Tables Overview

| Table | Description | Key Relations |
|-------|-------------|---------------|
| `users` | User accounts | — |
| `accounts` | Financial accounts (cash, bank, credit card) | → `users`, self-referencing (sub-accounts) |
| `categories` | Expense/income categories | → `users`, self-referencing (subcategories) |
| `transactions` | Financial transactions | → `users`, `accounts`, `categories` |
| `budgets` | Monthly budget limits | → `users`, `categories` |
| `savings_goals` | Savings goal tracking | → `users`, `categories`, `accounts` |
| `settings` | User preferences (currency, theme) | → `users` |
| `ai_chat_messages` | AI assistant conversation history | → `users` |
| `otp_codes` | Email verification codes | — |
| `login_devices` | Device tracking for security | → `users` |
| `bookmarks` | Saved transactions | → `users`, `transactions` |

### 🔗 Entity Relationship

```
users
 ├── accounts (1:N) ──── transactions (N:1)
 ├── categories (1:N) ── transactions (N:1)
 ├── budgets (1:N)
 ├── savings_goals (1:N)
 ├── settings (1:N)
 ├── ai_chat_messages (1:N)
 ├── login_devices (1:N)
 └── bookmarks (1:N) ── transactions (N:1)
```

---

## 🚀 Usage

### Fresh Install

Apply the complete schema to a new database:

```bash
psql $DATABASE_URL -f schema/001_initial_schema.sql
```

### Run Migrations

Apply incremental changes to an existing database:

```bash
psql $DATABASE_URL -f migrations/001_add_repeat_columns.sql
psql $DATABASE_URL -f migrations/002_add_account_parent.sql
psql $DATABASE_URL -f migrations/003_add_goals_relations.sql
```

---

## 📋 Default Categories

When a new user registers, the backend automatically seeds these default categories:

### 💸 Expense Categories (15)

| Category | Subcategories |
|----------|---------------|
| 🍔 Food | Breakfast, Lunch, Dinner, Hot Beverage, Cold Beverages, Alcoholic Beverages, Junk Snacks, Healthy Snacks, Online Orders |
| 🎬 Entertainment | Theater, Stage Shows, Passive Games, OTT Subscriptions, DTH |
| 🏡 Household | Appliances, Furnitures, Kitchen Items, Decoratives, Repair and Maintenance, Utility Items, Rent |
| 🏥 Health | Gym, Active Games, Supplements, Medicines, Doctor Consultation, Labs and Tests |
| 📈 Investments | Real Estate, Physical Gold, ETF, Stocks, Mutual Funds, Bonds, Digital Gold, Life Insurance, Health Insurance, Knowledge |
| 💅 Personal Care | Clothing, Clothing Accessories, Cosmetics, Parlour, Beauty Accessories |
| 🛒 Home Provisions | Online Grocery, Shop Grocery, Online Veggies, Shop Veggies, Online Fruits, Shop Fruits, Dairy, Meat |
| 📱 Recharges | Mobile Recharges, Wifi Bill |
| 🏦 Debts | Housing EMI, Credit Card EMI, Gold EMI, Friends, Family, Personal EMI |
| 🎁 Gifts | Family, Friends, Public |
| ✈️ Travel | Train, Bus, Car, Flight, Taxi, Toll |
| 🚗 Vehicle | Car Fuel, Bike Fuel, Car Maintenance, Bike Maintenance, Others |
| 🏖️ Vacation & Outing | Train, Bus, Car, Toll, Flight, Taxi, Entrance Fee, Breakfast, Lunch, Dinner, Snacks, Alcoholic Beverages |
| 🏛️ Government | ITR, Property Tax, Government Fees |
| 💡 Home Utilities | EB, Gas |

### 💰 Income Categories (5)

| Category | Icon |
|----------|------|
| Salary | 💰 |
| Business | 💼 |
| Freelancing | 💻 |
| Debt and Loan | 🏦 |
| Gifts and Rewards | 🎁 |

---

## 🔄 CI/CD Pipeline

Every push to `main` (affecting `schema/` or `migrations/`) triggers:

```
✅ Build → Spin up test PostgreSQL → Validate schema → Run all migrations
🔍 Test  → SonarQube scan (code quality)
🚀 Deploy → Apply migrations to production database
```

---

## 🔒 Hosting

| Environment | Provider | Details |
|-------------|----------|---------|
| **Production** | Neon | Serverless PostgreSQL, auto-scaling |
| **CI Testing** | GitHub Actions | Ephemeral PostgreSQL 16 container |

---

## 🏗️ Architecture

This database repo is part of the **Finly microservices architecture**:

| Service | Repository | Description |
|---------|------------|-------------|
| **Frontend** | [`finly-frontend`](https://github.com/nidhiflow/finly-frontend) | React SPA |
| **Backend** | [`finly-backend`](https://github.com/nidhiflow/finly-backend) | Express.js REST API |
| **Database** | [`finly-db`](https://github.com/nidhiflow/finly-db) | PostgreSQL schema & migrations (this repo) |

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/nidhiflow">NidhiFlow</a>
</p>
