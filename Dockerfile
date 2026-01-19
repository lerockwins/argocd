FROM nginx:alpine

# Copy all files from repo to nginx html folder
COPY . /usr/share/nginx/html

# Expose port
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
