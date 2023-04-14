
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with 

staged as (

    select  id, owner_id, created_at, deleted_at, date_of_birth, is_testing,
    sex, share_code, country_code, ethnicity, height_in_cm, weight_in_kg, 
    cigs_per_day, years_smoked, smoker_type, diagnoses, medications, medications_v2, 
    symptoms, tag, target_line_method_preferred,
    updated_at, created_by, last_modified_by, measurement_system, app_name, device_language
    from {{source('apiv2', 'api_profile') }}

)

select *
from staged

/*
    Removing PHI from api_profile table
*/


