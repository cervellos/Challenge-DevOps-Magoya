# Proyecto de CI/CD - Github y kubernetes

Este proyecto contiene una estrategia CI/CD en github y su infraestructura para AWS para el desafío MAGOYA.

- Usa un Terraform para aprovisionar recursos en AWS. Los recursos incluyen grupos de recursos, redes virtuales, subredes, IP públicas, clústeres de Kubernetes (ECK), declarado en la carpeta `Terraform`
- Contiene una aplicación simple en python que muestras un `Hello World!`, esta declarado en la carpeta `Cat-app`
- contiene un archivo `deployment` y un `service` para desplegar el contenedor con la aplicación en kubernetes
- contiene un Yaml con un pipeline para github que hace un `docker build` a la aplicación presente en `/Cat-app`,construye una imagen y hace push a la resgistry en AWS

### El flujo del pipeline

Para correr el pipeline tiene que ocurrir un push o un pull request desde un Branch `feature`, Este creara una imagen con docker el proyecto en `cat-app` y luego hará push a la imagen hacia la registry en AWS. Consecutivamente, se disparará el work de deploy y luego loguearse en el ECK, hará un `kubectl apply` al archivo deployment con la ultima imagen subida a la registry de AWS. 

Para desplegar la infraestructura en AWS solo requiere que clones el proyecto y logues tu consola con AWS. Luego en la ruta del proyecto terraform/examples/complete hacer `terraform init`, `terraform plan var-file="fixtures.us-east-2.tfvars"`, y un `terraform apply var-file="fixtures.us-east-2.tfvars"`


nota: las credenciales del runner solo permiten que ESTE y solo este repositoria haga push a la registry

### Deuda técnica
- pruebas automáticas tanto en el pipeline, como un test unitario cuando se crea la imagen en el dockerfile
- adaptar el proyecto Kubernetes
- limpiar y adaptar el terraform
- que el ECR esté declarado en terraform
- que la parte del despliegue la realize ARGO-CD. kubernetes no permite la comunicacion del runner del pipeline al cluster de kubernetes, necesita un hotfix o usar otra via para el despliegue
- falto la integracion de prometeus y grafana
