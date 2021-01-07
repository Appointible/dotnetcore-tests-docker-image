FROM mcr.microsoft.com/dotnet/sdk:3.1.404-alpine3.12
# Alpine Packages: https://pkgs.alpinelinux.org/packages

# Install tools.
RUN apk update && \
    apk upgrade && \
	apk add --no-cache \ 
				curl bash openssl nano supervisor python3 \
				redis

ADD /supervisor /src/supervisor
CMD ["supervisord","-c","/src/supervisor/service_script.conf"]

EXPOSE 6379