FROM alpine:latest

RUN apk add git --no-cache

RUN wget https://github.com/thoughtworks/talisman/releases/download/v1.31.0/talisman_linux_amd64
RUN chmod +x talisman_linux_amd64
RUN mv talisman_linux_amd64 /usr/local/bin/talisman

RUN apk add curl git
RUN mkdir ~/.talisman
RUN curl https://github.com/mrnim94/talisman-html-report/archive/refs/tags/v1.4.2.zip -o ~/.talisman/talisman_html_report.zip -J -L
RUN cd ~/.talisman && unzip talisman_html_report.zip -d . && mv talisman-html-report-1.4.2 talisman_html_report && rm talisman_html_report.zip

WORKDIR /mnt/data

ENTRYPOINT ["talisman"]