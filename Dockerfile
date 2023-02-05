FROM arm64v8/gcc:latest
RUN apt update && apt install -y tree
RUN apt install -y vim
RUN apt install -y git
RUN apt install -y gdb
