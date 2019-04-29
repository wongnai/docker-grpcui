# Docker Image for grpcui
Docker image for https://github.com/fullstorydev/grpcui

# Running a Container
To run a container, you need to set GRPCUI_SERVER to your grpc server (host:port).
You should also enable reflection proto service in your grpc server so the grpc-ui can read available services/methods.

    docker run -eGRPCUI_SERVER=172.17.0.1:8980 -p8080:8080 wongnai/grpcui


## Environment Variables
| Variable      | Description                                   | Default Value |
|---------------|-----------------------------------------------|---------------|
| GRPCUI_PORT   | grpc-ui server port                           | 8080          |
| GRPCUI_SERVER | grpc server host and port in host:port format |               |
|               |                                               |               |
