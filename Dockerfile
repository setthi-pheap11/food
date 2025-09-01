# Serve static files with nginx
FROM nginx:alpine

# Use nginx's default web root
WORKDIR /usr/share/nginx/html

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy ONLY your site files (we'll exclude build/config files via .dockerignore)
COPY . /usr/share/nginx/html/

# Optional: basic healthcheck
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget -q -O /dev/null http://localhost || exit 1

# Expose port 80
EXPOSE 80

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
