# command to verify the authenticity of the image and perform 
# vulnerability testing before building the image
export DOCKER_CONTENT_TRUST=1; docker build -t energi:v3.1.2 .

