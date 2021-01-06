FROM mcr.microsoft.com/dotnet/core/sdk:3.1

RUN apt update

# Install tools
RUN apt-get -y install zip
RUN apt-get install curl
RUN apt-get install sudo -y 

# Install https://www.serverless.com/ framework.
RUN curl -o- -L https://slss.io/install | bash    
RUN export PATH="$PATH:/root/.dotnet/tools"       # add lambda tools to path
RUN export PATH="$HOME/.serverless/bin:$PATH"     # add serverless tools to path

# Install Amazon Lambda Tools (required for sls deploy to aws lambdas)
RUN dotnet tool install -g Amazon.Lambda.Tools --framework netcoreapp3.1

# Install AWS CLI 2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install

# Install Redis server for local tests.
RUN sudo apt-get install -y redis-server

# Install ElasticSearch server for local tests.
#RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.10.1-amd64.deb
#RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.10.1-amd64.deb.sha512
#RUN shasum -a 512 -c elasticsearch-7.10.1-amd64.deb.sha512
#RUN sudo dpkg -i elasticsearch-7.10.1-amd64.deb
#RUN sudo -i service elasticsearch start

CMD aws --version
CMD sls --version
#CMD curl GET http://localhost:9200