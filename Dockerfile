FROM mcr.microsoft.com/dotnet/sdk:3.1.404-alpine3.12
# Alpine 3.11.7
# Packages: https://pkgs.alpinelinux.org/packages

# Install redis server
RUN apk add --no-cache redis
RUN redis-server --daemonize yes
EXPOSE 6379


RUN echo "------------ DONE -------------"
	
# Default to console.
CMD ["/bin/sh"]
