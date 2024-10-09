FROM debian:latest

RUN apt-get update && \
    apt-get install -y curl python3 && \
    curl -o /opt/hub.py https://raw.githubusercontent.com/mborgerson/l2tunnel/refs/heads/master/hub.py && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose necessary port for tunneling
EXPOSE 1337/udp

# Run hub.py with valid arguments
CMD ["python3", "/opt/hub.py", "--host", "0.0.0.0", "--port", "1337", "--verbose"]
