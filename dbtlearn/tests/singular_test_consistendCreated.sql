SELECT
    *
FROM
    {{ ref('dim_listings_cleansed') }} as listings
LEFT JOIN {{ ref('fct_reviews') }} as reviews
ON listings.listing_id = reviews.listing_id
WHERE reviews.review_date <= listings.created_at
LIMIT 10