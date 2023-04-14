FROM alpine:latest

RUN apk add git --no-cache

RUN wget https://github.com/thoughtworks/talisman/releases/download/v1.30.2/talisman_linux_amd64
RUN chmod +x talisman_linux_amd64
RUN mv talisman_linux_amd64 /usr/local/bin/talisman

RUN apk add curl git
RUN mkdir ~/.talisman
RUN curl https://github.com/jaydeepc/talisman-html-report/archive/v1.4.zip -o ~/.talisman/talisman_html_report.zip -J -L
RUN cd ~/.talisman && unzip talisman_html_report.zip -d . && mv talisman-html-report-1.4 talisman_html_report && rm talisman_html_report.zip

WORKDIR /mnt/data

ENTRYPOINT ["/usr/local/bin/talisman"]