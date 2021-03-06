# Network Test
#
# Runs periodic network tests and displays the results via a web server.

# Specify the base image.
FROM paradrop/workshop

# Install dependencies.  You can add additional packages here following the example.
RUN apt-get update && apt-get install -y \
#   <package> \
    nginx \
    dmidecode \
    pciutils \
    iperf


# Install files required by the chute.
#
# ADD <path_inside_repository> <path_inside_container>
#
ADD chute/index.html /usr/share/nginx/html/index.html
ADD chute/results.txt /usr/share/nginx/html/results.txt
ADD chute/run.sh /usr/local/bin/run.sh

# Make the web server's port available outside the container.  We will also
# need to configure port binding in the chute configuration.
#
# EXPOSE <port_inside_container>
#
EXPOSE 80

# This is the command that will be run inside the container.  It can be a bash
# script that runs other commands, a python script, a compiled binary, etc.
CMD ["bash", "/usr/local/bin/run.sh"]
