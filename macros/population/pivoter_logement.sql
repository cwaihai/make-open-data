{% macro pivoter_logement(deduplicated, colonne_a_aggreger) %}    



{% set colonne_a_aggreger_values_list = lister_colonne_a_aggrger_valeurs(colonne_a_aggreger) %}

    select 

    code_commune_insee,
    {{ dbt_utils.pivot(
        'champs__valeur',
        colonne_a_aggreger_values_list,
        agg='sum',
        then_value='population_par_commune_champs_valeur',
    ) }}
    from 
        deduplicated
    group by
        code_commune_insee

{% endmacro %}
