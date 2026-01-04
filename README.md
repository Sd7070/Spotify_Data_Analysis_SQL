# 🎵 Spotify Data Analysis - SQL Project

![Spotify Data Analysis](spotify-piano-and-headphones-psvd4nwl5u4foka8.jpg)

A comprehensive SQL-based data analysis project exploring Spotify music data with exploratory data analysis (EDA) and queries categorized by difficulty levels (Easy, Medium, and Advanced).

## 📋 Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Database Schema](#database-schema)
- [Project Structure](#project-structure)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [Query Categories](#query-categories)
- [Analysis Highlights](#analysis-highlights)
- [Dataset](#dataset)

## 🎯 Project Overview

This project demonstrates SQL skills by analyzing Spotify music data including:
- Audio features (danceability, energy, tempo, etc.)
- Streaming statistics (Spotify vs YouTube)
- Artist and album analytics
- Track performance metrics

The analysis is organized into three difficulty levels to showcase progressive SQL techniques from basic queries to advanced window functions.

## ✨ Features

- **Exploratory Data Analysis (EDA)**: Initial data exploration and cleaning
- **Easy Queries**: Basic SELECT, WHERE, GROUP BY operations
- **Medium Queries**: Aggregations, conditional logic, and joins
- **Advanced Queries**: Window functions, CTEs, subqueries, and complex analytics
- **Data Cleaning**: Removal of invalid records (zero duration tracks)

## 🗄️ Database Schema

The `spotify` table contains the following columns:

| Column | Type | Description |
|--------|------|-------------|
| `artist` | VARCHAR(255) | Artist name |
| `track` | VARCHAR(255) | Track name |
| `album` | VARCHAR(255) | Album name |
| `album_type` | VARCHAR(50) | Type of album (album, single, etc.) |
| `danceability` | FLOAT | Danceability score (0-1) |
| `energy` | FLOAT | Energy score (0-1) |
| `loudness` | FLOAT | Loudness in dB |
| `speechiness` | FLOAT | Speechiness score (0-1) |
| `acousticness` | FLOAT | Acousticness score (0-1) |
| `instrumentalness` | FLOAT | Instrumentalness score (0-1) |
| `liveness` | FLOAT | Liveness score (0-1) |
| `valence` | FLOAT | Valence (positivity) score (0-1) |
| `tempo` | FLOAT | Tempo in BPM |
| `duration_min` | FLOAT | Track duration in minutes |
| `title` | VARCHAR(255) | Video title |
| `channel` | VARCHAR(255) | YouTube channel name |
| `views` | FLOAT | Number of views |
| `likes` | BIGINT | Number of likes |
| `comments` | BIGINT | Number of comments |
| `licensed` | BOOLEAN | Licensed content flag |
| `official_video` | BOOLEAN | Official video flag |
| `stream` | BIGINT | Total streams |
| `energy_liveness` | FLOAT | Energy to liveness ratio |
| `most_played_on` | VARCHAR(50) | Primary platform (Spotify/YouTube) |

## 📁 Project Structure

```
Spotify_Data_Analysis_SQL/
│
├── spotify_data_analysis.sql    # Main SQL script with all queries
├── cleaned_data.csv             # Dataset file
├── spotify-piano-and-headphones-psvd4nwl5u4foka8.jpg  # Project image
└── README.md                     # Project documentation
```

## 🛠️ Technologies Used

- **SQL** (PostgreSQL/MySQL compatible)
- **CSV** data format
- SQL features used:
  - Basic SQL operations (SELECT, WHERE, GROUP BY, ORDER BY)
  - Aggregate functions (COUNT, SUM, AVG, MAX, MIN)
  - Window functions (DENSE_RANK, SUM OVER)
  - Common Table Expressions (CTEs)
  - Subqueries
  - Conditional logic (CASE statements)
  - Data type handling

## 🚀 Getting Started

### Prerequisites

- SQL database system (PostgreSQL)
- CSV file import capability
- SQL client/interface (pgAdmin)

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/Sd7070/Spotify_Data_Analysis_SQL.git
   cd Spotify_Data_Analysis_SQL
   ```

2. **Import the dataset**
   - Import `cleaned_data.csv` into your database
   - Create the table structure using the CREATE TABLE statement in the SQL file
   - Load the CSV data into the `spotify` table

3. **Run the SQL queries**
   - Open `spotify_data_analysis.sql` in your SQL client
   - Execute queries section by section
   - Or run the entire script

### Example: Creating Table and Importing Data

```sql
-- Create the table (from spotify_data_analysis.sql)
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    -- ... (see full schema in SQL file)
);


## 📊 Query Categories

### 🔵 Easy Category (5 Queries)

1. **High-Streaming Tracks**: Find tracks with more than 1 billion streams
2. **Album-Artist Mapping**: List all albums with their respective artists
3. **Licensed Content Comments**: Calculate total comments for licensed tracks
4. **Single Albums**: Find all tracks belonging to single-type albums
5. **Artist Track Count**: Count total tracks by each artist

**Skills Demonstrated**: Basic SELECT, WHERE, GROUP BY, aggregate functions

### 🟡 Medium Category (5 Queries)

6. **Album Danceability**: Calculate average danceability per album
7. **Top Energy Tracks**: Find top 5 tracks with highest energy values
8. **Official Video Metrics**: List tracks with views and likes for official videos
9. **Album Views**: Calculate total views for tracks in each album
10. **Platform Comparison**: Find tracks streamed more on Spotify than YouTube

**Skills Demonstrated**: Aggregations, GROUP BY with multiple columns, conditional aggregation (CASE statements)

### 🔴 Advanced Category (5 Queries)

11. **Top Tracks per Artist**: Find top 3 most-viewed tracks for each artist using window functions
12. **Above-Average Liveness**: Find tracks with liveness above the dataset average using subqueries
13. **Energy Range Analysis**: Calculate energy difference (max-min) per album using CTEs
14. **Energy-Liveness Ratio**: Find tracks where energy-to-liveness ratio > 1.2
15. **Cumulative Likes**: Calculate cumulative sum of likes ordered by views using window functions

**Skills Demonstrated**: Window functions (DENSE_RANK, SUM OVER), CTEs (WITH clauses), subqueries, advanced analytics

## 📈 Analysis Highlights

- **Data Exploration**: Comprehensive EDA including data quality checks and cleaning
- **Performance Metrics**: Analysis of streaming, views, likes, and comments
- **Audio Feature Analysis**: Insights into musical characteristics (energy, danceability, liveness)
- **Platform Analytics**: Comparison between Spotify and YouTube performance
- **Ranking Analysis**: Top-performing tracks and artists using advanced ranking functions
- **Statistical Analysis**: Average calculations, cumulative sums, and comparative metrics

## 📦 Dataset

- **File**: `cleaned_data.csv`
- **Format**: CSV with headers
- **Content**: Spotify music data with audio features and streaming metrics
- **Data Quality**: Pre-cleaned dataset (zero-duration tracks removed)

## 📝 Notes

- All queries are compatible with PostgreSQL, MySQL, and most SQL databases
- Some syntax may need minor adjustments based on your database system
- The dataset should be imported before running the analysis queries
- Queries are organized sequentially and can be run independently

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the issues page.

## 📄 License

This project is open source and available for educational purposes.

---

⭐ If you find this project helpful, please consider giving it a star!

