# Muestra del proyecto de Gestor Estadístico

## Para levantar el proyecto:
1) Crear el entorno virtual:
    ```
    python3 -m venv env  
    source env/bin/activate
    ```

2) Instalar las dependencias necesarias:

    `pip install -r requirements.txt`

3) Realizar las migraciones:

    ```
    python3 manage.py makemigrations
    python3 manage.py migrate
    ```

4) Crear usuario:

    `python3 manage.py createsuperuser`

5) Levantar el servidor de desarrollo:

    `python3 manage.py runserver`

--------------------------------------------------
## Docker

Para la primera vez 

1) `cp .env_sample .env`
2) `docker-compose up --build -d`


## Crear usuario superusuario
`docker-compose exec django python manage.py createsuperuser`

y seguir las indicaciones

--------------------------------------------------

# El login exitoso redirige a la página de administración, para quitar este comportamiento comentar la siguiente línea en el archivo src/config/urls.py:

```
urlpatterns = [
    ...

    path("", RedirectView.as_view(url="/admin")),  # Redirige luego del login a la pagina de admin
    
    ...
]

```