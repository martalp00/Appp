"""
Este módulo contiene las vistas para la aplicación web "Appp"
"""
import requests

from django.shortcuts import render
from django.http import HttpResponse
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST

metric_count_artist_searches_total = Counter(
    'metric_count_artist_searches_total', 
    'Número de búsquedas de artistas en total'
)

def search(request):
    return render(request, 'search.html')

def search_results(request):
    artist = request.GET.get('artist')
    url = f'https://ws.audioscrobbler.com/2.0/?method=artist.search&artist={artist}&api_key=6364e51db1e7ec45657136ed75292af0&format=json'
    response = requests.get(url)
    data = response.json()
    artists = data['results']['artistmatches']['artist']
    metric_count_artist_searches_total.inc()
    if artists:
        return render(request, 'search_results.html', {'artists': artists})
    else:
        return render(request, 'search_results.html', {'error': 'No artist found.'})

def albums(request, artist_name):
    url = f'https://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&artist={artist_name}&api_key=6364e51db1e7ec45657136ed75292af0&format=json'
    response = requests.get(url)
    data = response.json()
    albums = data['topalbums']['album']
    return render(request, 'albums.html', {'albums': albums})

def metrics(request):
    return HttpResponse(generate_latest(), content_type=CONTENT_TYPE_LATEST)