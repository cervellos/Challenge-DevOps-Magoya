¡Claro! A continuación te dejo una aplicación sencilla en Python que puedes dockerizar y desplegar en Kubernetes. Esta aplicación es un servicio web básico que devuelve un mensaje en formato JSON. 

### Paso 1: Crear la Aplicación



### Paso 2: Crear el Dockerfile



### Paso 3: Construir y Ejecutar el Contenedor

Construye la imagen Docker:

```bash
docker build -t mi-aplicacion:latest .
```

Ejecuta el contenedor:

```bash
docker run -p 5000:5000 mi-aplicacion:latest
```

Visita `http://localhost:5000` en tu navegador y deberías ver el mensaje JSON.

### Paso 4: Crear Archivos de Kubernetes


### Paso 5: Subir la Imagen a Docker Hub

1. Inicia sesión en Docker Hub:
   ```bash
   docker login
   ```

2. Etiqueta tu imagen:
   ```bash
   docker tag mi-aplicacion:latest tu_usuario_dockerhub/mi-aplicacion:latest
   ```

3. Sube la imagen:
   ```bash
   docker push tu_usuario_dockerhub/mi-aplicacion:latest
   ```

### Paso 6: Desplegar en Kubernetes

1. Aplica el archivo de despliegue:
   ```bash
   kubectl apply -f k8s/deployment.yaml
   ```

2. Aplica el archivo del servicio:
   ```bash
   kubectl apply -f k8s/service.yaml
   ```

3. Verifica el estado de tu despliegue:
   ```bash
   kubectl get deployments
   kubectl get services
   ```

Después de un momento, deberías obtener una dirección IP externa del servicio. Usa esa IP para acceder a tu aplicación en el navegador.

### Configurar Secretos en GitHub

Ve a tu repositorio en GitHub y navega a Settings > Secrets and variables > Actions. Crea los siguientes secretos:

    AWS_ACCESS_KEY_ID: Tu ID de clave de acceso de AWS.
    AWS_SECRET_ACCESS_KEY: Tu clave de acceso secreta de AWS.
    ECR_REGISTRY: La URL de tu registro de Amazon ECR (por ejemplo, 123456789012.dkr.ecr.us-west-2.amazonaws.com).

# Challenge-DevOps-Magoya
