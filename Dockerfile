# Use a lightweight web server image
FROM nginx:alpine

# Remove the default NGINX configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy your HTML file to the web server directory
COPY index.html /usr/share/nginx/html

# Copy your CSS file to the web server directory
COPY css/style.css /usr/share/nginx/html/css/

# Copy your images to the web server directory
COPY img/kvk.png /usr/share/nginx/html/img/
COPY img/va.jpg /usr/share/nginx/html/img/
COPY img/virat.jpg /usr/share/nginx/html/img/
COPY img/vk.jpg /usr/share/nginx/html/img/
COPY img/vk2.jpg /usr/share/nginx/html/img/
COPY img/vk100.jpg /usr/share/nginx/html/img/
COPY img/vkgl.png /usr/share/nginx/html/img/
COPY img/vksd.jpg /usr/share/nginx/html/img/
# Copy your custom NGINX configuration
COPY nginx.conf /etc/nginx/conf.d/

# Expose port 80
EXPOSE 80
