{
    "metadata": {
        "kernelspec": {
            "name": "SQL",
            "display_name": "SQL",
            "language": "sql"
        },
        "language_info": {
            "name": "sql",
            "version": ""
        }
    },
    "nbformat_minor": 2,
    "nbformat": 4,
    "cells": [
        {
            "cell_type": "markdown",
            "source": [
                "**SQL ASSESSMENT ANSWERS**\n",
                "\n",
                "\\*NOTE: This file contains the appropriate SQL statements but not the query results\\*"
            ],
            "metadata": {
                "azdata_cell_guid": "fd955465-92ca-4b87-95fc-e092e30dca8b"
            },
            "attachments": {}
        },
        {
            "cell_type": "markdown",
            "source": [
                "**Question 1**"
            ],
            "metadata": {
                "azdata_cell_guid": "4a74085f-f747-4d3b-95c9-3b21574543f4"
            },
            "attachments": {}
        },
        {
            "cell_type": "code",
            "source": [
                "SELECT date AS Date, SUM(impressions) AS Total_Impressions\n",
                "FROM marketing_performance\n",
                "GROUP BY date\n",
                "ORDER BY Total_Impressions DESC"
            ],
            "metadata": {
                "azdata_cell_guid": "b0f9349a-0d54-43ad-8d10-189bb364f6a5",
                "language": "sql"
            },
            "outputs": [],
            "execution_count": null
        },
        {
            "cell_type": "markdown",
            "source": [
                "**Question 2**"
            ],
            "metadata": {
                "azdata_cell_guid": "84d4a85c-5b53-4f40-8a24-3d591bf23249"
            },
            "attachments": {}
        },
        {
            "cell_type": "code",
            "source": [
                "SELECT state AS State, SUM(revenue) AS Total_Revenue\n",
                "FROM website_revenue\n",
                "GROUP BY state\n",
                "ORDER BY Total_Revenue DESC\n",
                "LIMIT 3\n",
                "\n",
                "-- Ohio generated the third most revenue "
            ],
            "metadata": {
                "azdata_cell_guid": "f930d09c-e539-4903-90de-23270c6e714f",
                "language": "sql"
            },
            "outputs": [],
            "execution_count": null
        },
        {
            "cell_type": "markdown",
            "source": [
                "**Question 3**"
            ],
            "metadata": {
                "azdata_cell_guid": "00bef37c-ae8e-4a6a-8fe8-c2d74412ebee"
            },
            "attachments": {}
        },
        {
            "cell_type": "code",
            "source": [
                "SELECT c.name AS Campaign_Name, \n",
                "ROUND(SUM(mp.cost), 2) AS Total_Cost, \n",
                "SUM(mp.impressions) AS Total_Impressions, \n",
                "SUM(mp.clicks) AS Total_Clicks,\n",
                "SUM(wr.revenue) AS Total_Revenue\n",
                "FROM campaign_info c\n",
                "INNER JOIN marketing_performance mp\n",
                "ON c.id = mp.campaign_id\n",
                "INNER JOIN website_revenue wr\n",
                "ON c.id = wr.campaign_id\n",
                "GROUP BY c.name"
            ],
            "metadata": {
                "azdata_cell_guid": "d511a38b-a49f-4bd3-9c81-b91617ff099c",
                "language": "sql"
            },
            "outputs": [],
            "execution_count": null
        },
        {
            "cell_type": "markdown",
            "source": [
                "**Question 4**"
            ],
            "metadata": {
                "azdata_cell_guid": "e960134b-7999-4893-bf37-b30067e725e0"
            },
            "attachments": {}
        },
        {
            "cell_type": "code",
            "source": [
                "SELECT wr.state AS State, \n",
                "SUM(mp.conversions) AS Total_Conversions\n",
                "FROM campaign_info c\n",
                "INNER JOIN marketing_performance mp\n",
                "ON c.id = mp.campaign_ID\n",
                "INNER JOIN website_revenue wr\n",
                "ON c.id = wr.campaign_id\n",
                "WHERE c.name = 'Campaign5'\n",
                "GROUP BY wr.STATE\n",
                "ORDER BY Total_Conversions DESC\n",
                "\n",
                "-- Georgia generated the most conversions"
            ],
            "metadata": {
                "azdata_cell_guid": "a816dfd4-2111-4a9d-bcf9-b93d33f7159f",
                "language": "sql"
            },
            "outputs": [],
            "execution_count": null
        },
        {
            "cell_type": "markdown",
            "source": [
                "**Question 5**"
            ],
            "metadata": {
                "azdata_cell_guid": "928edd30-ae9a-45be-ae9c-a074485d7d4a"
            },
            "attachments": {}
        },
        {
            "cell_type": "code",
            "source": [
                "SELECT c.name AS Campaign_Name, \n",
                "ROUND(SUM(mp.cost), 2) AS Total_Cost, \n",
                "SUM(mp.impressions) AS Total_Impressions, \n",
                "SUM(mp.clicks) AS Total_Clicks,\n",
                "SUM(wr.revenue) AS Total_Revenue,\n",
                "ROUND(SUM(wr.revenue) - SUM(mp.cost), 2) AS Total_Profit,\n",
                "ROUND(SUM(CAST(mp.conversions AS FLOAT)) / SUM(CAST(mp.clicks AS FLOAT)), 2) AS Click_Conversion_Rate\n",
                "FROM campaign_info c\n",
                "INNER JOIN marketing_performance mp\n",
                "ON c.id = mp.campaign_id\n",
                "INNER JOIN website_revenue wr\n",
                "ON c.id = wr.campaign_id\n",
                "GROUP BY c.name\n",
                "ORDER BY Total_Profit DESC\n",
                "\n",
                "-- Based on the query above, I would say that Campaign 3 was the most efficient. \n",
                "-- Not only did it generate the highest profits but it also shared the highest click conversion rate with Campaign 2. \n",
                "-- This means Campaign 3 has the highest percentage of people who clicked on an ad and then bought the product or service being offered."
            ],
            "metadata": {
                "azdata_cell_guid": "4a68546a-edc0-466d-905b-081f056e3399",
                "language": "sql"
            },
            "outputs": [],
            "execution_count": null
        }
    ]
}