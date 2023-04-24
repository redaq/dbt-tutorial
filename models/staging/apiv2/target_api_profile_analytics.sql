
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with 

staged as (

    select p.id, p.owner_id, p.created_at, p.deleted_at, p.date_of_birth, p.is_testing,
    p.sex, p.share_code, p.country_code, p.ethnicity, p.height_in_cm, p.weight_in_kg, 
    p.cigs_per_day, p.years_smoked, p.smoker_type, p.diagnoses, p.medications, p.medications_v2, 
    p.symptoms, p.tag, p.target_line_method_preferred,
    p.updated_at, p.created_by, p.last_modified_by, p.measurement_system, p.app_name, p.device_language
    from {{source('apiv2', 'api_profile') }} p
)

select *
from staged

/*
    Removing PHI from api_profile table
*/


