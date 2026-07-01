{{ config(materialized='table') }}

select
    b.BOOKING_ID,
    b.LISTING_ID,
    b.BOOKING_DATE,
    b.TOTAL_BOOKING_AMOUNT,
    b.BOOKING_STATUS,
    b.CREATED_AT as BOOKING_CREATED_AT,
    l.PROPERTY_TYPE,
    l.ROOM_TYPE,
    l.CITY,
    l.COUNTRY,
    l.BEDROOMS,
    l.ACCOMMODATES,
    l.BATHROOMS,
    l.PRICE_PER_NIGHT

from {{ ref('dim_bookings') }} b
left join {{ ref('dim_listings') }} l 
    on b.LISTING_ID = l.LISTING_ID