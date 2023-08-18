# Use an official Python image as the base
FROM python:3.8-slim

# Set environment variables
ENV AIRFLOW_HOME=/airflow
ENV AIRFLOW__CORE__LOAD_EXAMPLES=False

# Install required packages
RUN pip install apache-airflow

# Install Helm and other dependencies
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y nano && \
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && \
    chmod +x get_helm.sh && \
    ./get_helm.sh

# Create a dags directory
RUN mkdir -p $AIRFLOW_HOME/dags

# Initialize the database
RUN airflow db init

# Expose the necessary port
EXPOSE 8080

# Start Airflow webserver
CMD ["airflow", "webserver", "--port", "8080", "--host", "0.0.0.0"]
