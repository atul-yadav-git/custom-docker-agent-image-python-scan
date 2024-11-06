# Use Python 3.9-slim as the base image
FROM python:3.9-slim

# Create a non-root user and switch to that user
RUN useradd -m appuser

# Set the working directory
#WORKDIR /app #im not setting as my code path i dont wish to change

# Install system dependencies and Python packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc libffi-dev && \
    pip install --upgrade pip && \
    pip install bandit pip-audit flake8 pytest && \
    apt-get remove --purge -y gcc libffi-dev && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*


#change ownership
#RUN chown -R appuser:appuser /app

# Switch to the non-root user
USER appuser


# Set the entrypoint or command to run your application or scans
CMD ["bash"]

