from prometheus_client import Counter

metric_count_artist_searches_total = Counter(
    'metric_count_artist_searches_total', 
    'Número de búsquedas de artistas en total'
)