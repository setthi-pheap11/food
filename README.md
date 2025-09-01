# Khmer Food Learning Website

A beautiful, responsive website for learning Khmer cooking recipes with Docker and Kubernetes deployment.

## Project Structure

```
food/
├── index.html              # Main website file
├── Dockerfile              # Docker container configuration
├── docker-compose.yml      # Docker Compose for local development
├── deployment.yaml         # Kubernetes Deployment
├── service.yaml           # Kubernetes Service
├── ingress.yaml           # Kubernetes Ingress
├── .dockerignore          # Docker ignore file
└── README.md              # This file
```

## Features

- 🍳 Interactive Khmer cooking recipes
- 📱 Mobile-responsive design
- 🎨 Beautiful UI with gradients and animations
- 🥘 Recipe modal with detailed ingredients and steps
- 🌐 Multi-language support (Khmer)

## Quick Start

### Using Docker Compose (Recommended for Development)

```bash
# Build and run the application
docker-compose up -d

# Access the website
# Open http://localhost:7070 in your browser

# Stop the application
docker-compose down
```

### Using Docker directly

```bash
# Build the Docker image
docker build -t food-app .

# Run the container
docker run -d -p 7070:80 --name food-container food-app

# Access the website
# Open http://localhost:7070 in your browser

# Stop and remove the container
docker stop food-container
docker rm food-container
```

### Using Kubernetes

```bash
# Apply all Kubernetes configurations
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress.yaml

# Check deployment status
kubectl get pods
kubectl get services
kubectl get ingress

# Access the website
# If using NodePort: http://localhost:30080
# If using Ingress: http://localhost (requires ingress controller)

# Clean up
kubectl delete -f deployment.yaml
kubectl delete -f service.yaml
kubectl delete -f ingress.yaml
```

## Configuration Details

### Docker Configuration

- **Base Image**: `nginx:alpine` (lightweight and secure)
- **Port**: 80 (internal), 7070 (external)
- **Security**: Non-root user, security headers
- **Health Check**: HTTP endpoint monitoring

### Kubernetes Configuration

- **Replicas**: 4 (for high availability)
- **Resources**: 
  - Requests: 64Mi memory, 50m CPU
  - Limits: 128Mi memory, 100m CPU
- **Health Checks**: Liveness and readiness probes
- **Service Type**: NodePort (port 30080)

### Ingress Configuration

- **Controller**: NGINX Ingress
- **Host**: localhost (change for production)
- **Path**: `/*` (matches all paths)
- **SSL**: Disabled for development

## Production Considerations

1. **Security**:
   - Change default host in ingress.yaml
   - Enable SSL/TLS certificates
   - Use secrets for sensitive data

2. **Performance**:
   - Adjust resource limits based on load
   - Consider horizontal pod autoscaling
   - Use CDN for static assets

3. **Monitoring**:
   - Add logging configuration
   - Set up monitoring and alerting
   - Configure backup strategies

## Troubleshooting

### Common Issues

1. **Port already in use**:
   ```bash
   # Change port in docker-compose.yml or stop conflicting service
   docker-compose down
   ```

2. **Kubernetes pods not starting**:
   ```bash
   # Check pod logs
   kubectl logs deployment/food-web
   
   # Check pod status
   kubectl describe pod <pod-name>
   ```

3. **Ingress not working**:
   ```bash
   # Ensure ingress controller is installed
   kubectl get pods -n ingress-nginx
   
   # Check ingress status
   kubectl describe ingress food-ingress
   ```

### Health Checks

- **Docker**: `http://localhost:7070`
- **Kubernetes NodePort**: `http://localhost:30080`
- **Kubernetes Ingress**: `http://localhost`

## Development

To modify the website:

1. Edit `index.html`
2. Rebuild the Docker image:
   ```bash
   docker-compose up --build
   ```

## License

© 2025 Learn Khmer Cooking - All rights reserved
Made with ❤️ for Khmer food 🇰🇭
