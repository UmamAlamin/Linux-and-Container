There are two main tasks in this project:

1. Deployment
2. Automated Backup Scheduling
Deployment

The deployment process involves using Docker as the main tool. Create two images required to run the application:

    •	Flask Application Image: This image will contain the Flask web application.
  
    •	PostgreSQL Database Image: This image will contain the PostgreSQL database.
  
The Flask application image depends on the PostgreSQL image because the Flask application requires a connection to the PostgreSQL database at runtime.

Automated Data Backup Scheduling
In addition to deployment, also responsible for setting up automatic data backup scheduling for the PostgreSQL database. The backup should be performed daily to ensure data security and reliability. Additionally, create a script to restore data from these backups, enabling quick data recovery in case of failure or database corruption.
