"""
Este módulo contiene las vistas para la aplicación web "Appp"
"""
from django.shortcuts import render


def homepage(request):
    """
    Renderiza la página de inicio.

    Args:
        request: La solicitud HTTP entrante.

    Returns:
        La respuesta HTTP que contiene la página de inicio renderizada.
    """
    return render(request, 'homepage.html')
