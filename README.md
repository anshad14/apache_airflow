# Apache Airflow Dockerized Deployment

This repository provides a Dockerfile and instructions to set up an Apache Airflow instance using Docker. Apache Airflow is a platform used to programmatically author, schedule, and monitor workflows.

## Dockerfile Overview

The provided Dockerfile allows you to create a Docker image containing Apache Airflow along with Helm and other dependencies. Here's a breakdown of what the Dockerfile does:

1. Use an official Python image as the base (`python:3.8-slim`).
2. Set environment variables:
   - `AIRFLOW_HOME`: The directory where Airflow configuration and DAGs will be stored.
   - `AIRFLOW__CORE__LOAD_EXAMPLES`: Disable loading example DAGs.
3. Install `apache-airflow` using `pip`.
4. Install `Helm` and other required dependencies using `apt-get`.
5. Create a directory for Airflow DAGs.
6. Initialize the Airflow database using `airflow db init`.
7. Expose port 8080 for the Airflow web interface.
8. Start the Airflow webserver.

## Getting Started

To deploy your Apache Airflow instance using this Dockerfile, follow these steps:

1. **Build the Docker Image**: In your terminal, navigate to the directory containing the Dockerfile and run:

   ```bash
   docker build -t airflow-container .
   ```
   This will build a Docker image named airflow-container.
2. **Run the Docker Container**: After building the image, run the following command to start the container:
   ```
   docker run -p 8080:8080 airflow-container
   ```
   This will start the Airflow webserver, accessible at **http://localhost:8080**
3. **Access the Airflow Web Interface**: Open your web browser and navigate to http://localhost:8080 to access the Airflow web interface. You can configure and manage your workflows from here.

## Customization
**DAGs**: Add your custom DAGs by placing them in the dags directory within your *AIRFLOW_HOME* directory.
Configuration: Customize your Airflow configuration by editing the necessary Airflow configuration files.
## Note
This Dockerfile and setup are intended for development and testing purposes. For production deployments, consider implementing appropriate security measures and optimizations.
