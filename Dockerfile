FROM ghcr.io/graalvm/truffleruby:22.3.1

WORKDIR /usr/src/app
COPY main.rb ./

ENTRYPOINT ["ruby", "main.rb"]
CMD ["ruby", "main.rb", "100", "cf"]
