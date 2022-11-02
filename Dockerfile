FROM energi:v3.1.2
RUN apk add curl \
    && curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin \
    && trivy filesystem --exit-code 1 --no-progress /
CMD ["/bin/sh", "/bin/sh -c apk add --no-cache"]
COPY file:fe1d076301c211c7d4d517686368e54574687f48aeca7290d244077082527e94 in /usr/local/bin/ 
EXPOSE 39795 39796 39797
ENTRYPOINT ["energi3"]