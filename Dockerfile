FROM python:3-alpine

# Captain static websites require src
WORKDIR /src

RUN sed -i 's/https/http/g' /etc/apk/repositories
RUN apk add build-base
RUN pip install mkdocs mkdocs-material mkdocs-markdownextradata-plugin pygments

EXPOSE 8080

ENTRYPOINT [ "mkdocs" ]
CMD ["serve", "-a", "0.0.0.0:8080"]
