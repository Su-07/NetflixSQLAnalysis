# Netflix Movies and TV Shows Data Analysis using SQL
![Netflix Logo](https://github.com/Su-07/NetflixSQLAnalysis/blob/main/logo.png)

## 📊 Project Overview  
This SQL project explores and analyzes content data from Netflix to uncover insights about viewership trends, content diversity, and platform strategy. The dataset includes metadata about TV shows and movies such as title, cast, director, genre, release year, duration, country, and description.

The project addresses **15+ business questions** through advanced SQL queries, making it a strong demonstration of practical SQL skills applied to real-world streaming data.

---

## 🎯 Objectives
- Analyze the distribution of content types (Movies vs TV Shows)
- Identify popular genres, countries, and directors
- Discover trends in content duration, addition dates, and actor appearances
- Evaluate sensitive content using keyword-based classification
- Provide insights for content planning, acquisition, and regional targeting

---

## 🛠️ Tools & Technologies
- **PostgreSQL / MySQL / SQLite** – SQL environment for querying the data
- **SQL** – Including: `GROUP BY`, `RANK()`, `UNNEST`, `STRING_TO_ARRAY`, `CASE`, `JOINs`, and `Window Functions`

---

## 📁 Dataset Structure  
The dataset (simulated via SQL table) includes the following fields:

- `show_id`  
- `type` (Movie or TV Show)  
- `title`  
- `director`  
- `casts`  
- `country`  
- `date_added`  
- `release_year`  
- `rating`  
- `duration`  
- `listed_in` (genres)  
- `description`  

---

## 🔍 Key SQL Queries & Insights

### ✅ KPIs & Distribution Metrics
- Count of **Movies vs TV Shows**
- Most **common content ratings**
- Total **number of releases per genre and country**
- **Top 5 countries** with the most content

### 📈 Trend Analysis
- Daily and monthly content trends
- Content **added in the last 5 years**
- **Average yearly content releases** in India
- All content by specific **director (e.g., Rajiv Chilaka)**

### 🏆 Rankings & Highlights
- **Longest movie** by duration
- Top 10 **actors** in Indian-produced content
- All **TV Shows with more than 5 seasons**
- Actor-based filter: e.g., **Salman Khan's movies in the last 10 years**

### 🧠 Sentiment/Keyword Categorization
- Classify content as **"Good" or "Bad"** based on presence of keywords like _kill_ or _violence_ in the description  
- Return count of items under each category

---

## 💡 Business Value
- 📍 Supports **content acquisition** strategies by identifying popular regions, genres, and formats
- 🎯 Helps target audiences based on actor/director popularity and content preferences
- 🔐 Enables **content moderation** by identifying potentially sensitive content
- 🗓️ Reveals **release trends** for better planning of new launches

---

⭐ If this project helped you learn or was insightful, consider giving it a **star**!
