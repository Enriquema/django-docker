
sudo service status docker
sudo service start docker
sudo service status docker

# cd to you directory
sudo docker-compose up --build

# migrate db
sudo docker-compose run mobre_app python mobre/manage.py migrate
sudo docker-compose run mobre_app python mobre/manage.py collectstatic

# Si se quiere quitar el sudo, hay que añadir el usuario de la máquina al gurpo docker, lo comentado de a continuacion
# https://stackoverflow.com/questions/29101043/cant-connect-to-docker-from-docker-compose
# By default the docker daemon always runs as the root user, therefore you need to prepend sudo to your Docker command(s).

# If you don’t want to use sudo when you use the docker command, create a Unix group called docker and add users to it. When the docker daemon starts, it makes the ownership of the Unix socket read/writable by the docker group.

# To create the docker group and add your user:
# Create the docker group.

# $ sudo groupadd docker

# Add your user to the docker group.

# $ sudo usermod -aG docker $USER

# Log out and log back in so that your group membership is re-evaluated.

# Verify that you can docker commands without sudo.

# $ docker run hello-world

# This command downloads a test image and runs it in a container. When the container runs, it prints an informational message and exits.

# The steps outlined above comes from the official Docker documentation.