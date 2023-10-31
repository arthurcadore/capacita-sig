FROM arthurcadore/sig_intelbras:1.0.17.13

COPY ./src/startup.sh /home/startup.sh

RUN chmod +x /home/startup.sh

CMD ["/home/startup.sh"]

