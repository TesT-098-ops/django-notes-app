#!/bin/bash


<< Readme

This script will successfully run the django app, make sure to fork the repo from shubham's github repo's.
The script is bound to work on any machine and is properly bound to function without any errors.
Error-Handling is also done as said above...

Readme


echo "********************* WELCOME TO THE SCRIPT ********************************"
echo "##################### STARTING ###################################"

cloning_repo() {

        if [[ -d "django-notes-app" ]];
        then
                echo "Repo already exists..."
                return 1
        fi


        echo "Cloning the TWS Django-app-Repo..."
        echo "Cloning Started ......."
        git clone https://github.com/TesT-098-ops/django-notes-app.git
        cd django-notes-app

}


installing_requirements() {

        echo "Preparing to Install all the required dependencies..."
        echo "Installing Started"
        sudo apt-get install docker.io nginx -y docker-compose
        echo "Dependencies Installed Successfully......."
        #return 1
}

required_reboot() {

        echo "Restarting the services........"
        sudo chown $USER /var/run/docker.sock
        #sudo systemctl enable nginx
        #sudo systemctl enable docker
        #suso systemctl restart docker
        #return 1

}

deploy() {
        echo "Starting the Deployment phase........"

        docker build -t notes-app .
        #docker run -d -p 8000:8000 notes-app:latest
        docker-compose up -d
        #return 1

}

if ! cloning_repo; then

        echo "The Directory Already Exists......"
        exit 1

fi

if ! installing_requirements; then

        echo " The Installing of requirements failed....."
        exit 1

fi

if ! required_reboot; then

        echo "System Fault identified.."
        exit 1

fi

if ! deploy; then

        echo "Deployment Failed, Please contact admin"
        # sendmail
        exit 1

fi

echo "**********************DEPLOYEMENT ENDED SUCCESSFULLY**************************************"
