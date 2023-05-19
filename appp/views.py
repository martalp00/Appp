"""
Este módulo contiene las vistas para la aplicación web "Appp"
"""
# pylint: disable=import-error
import requests
from django.http import HttpResponse
from django.shortcuts import render
from prometheus_client import CONTENT_TYPE_LATEST, Counter, generate_latest

metric_count_artist_searches_total = Counter(
    'metric_count_artist_searches_total', 
    'Número de búsquedas de artistas en total'
)

def search(request):
    # pylint: disable=missing-function-docstring
    return render(request, 'search.html')

def search_artist(request):
    # pylint: disable=missing-function-docstring
    artist = request.GET.get('artist')
    url = (f'https://ws.audioscrobbler.com/2.0/?method=artist.search&artist={artist}&api_key='
           + '6364e51db1e7ec45657136ed75292af0&format=json')
    response = requests.get(url, timeout=5)
    data = response.json()
    artists = data['results']['artistmatches']['artist']
    metric_count_artist_searches_total.inc()
    if artists:
        return render(request, 'search_artist.html', {'artists': artists})
    return render(request, 'search_artist.html', {'error': 'No artist found.'})

def artist_albums(request, artist_name):
    # pylint: disable=missing-function-docstring
    url = ('https://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&artist='
           f'{artist_name}&api_key=6364e51db1e7ec45657136ed75292af0&format=json'
    )
    response = requests.get(url, timeout=10)
    data = response.json()
    albums = data['topalbums']['album']
    return render(request, 'artist_albums.html', {'albums': albums})

def metrics(request):
    # pylint: disable=missing-function-docstring
    # pylint: disable=unused-argument
    return HttpResponse(generate_latest(), content_type=CONTENT_TYPE_LATEST)
