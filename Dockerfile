FROM rocker/shiny:latest

# Install R dependencies
RUN R -e "install.packages(c('shiny', 'rmarkdown'), repos='https://cran.rstudio.com/')"

# Copy your app to the image
COPY ./app /srv/shiny-server/myapp

# Make the app accessible to shiny-server
RUN chmod -R 755 /srv/shiny-server/myapp

# OpenShift runs containers with a random UID
# Ensure proper permissions
RUN chmod -R 777 /var/lib/shiny-server
RUN chmod -R 777 /var/log/shiny-server

# Create a basic health check file for readiness probe
RUN echo "OK" > /srv/shiny-server/myapp/health.txt
RUN chmod 755 /srv/shiny-server/myapp/health.txt

# Expose the port
EXPOSE 3838

CMD ["/usr/bin/shiny-server"]
