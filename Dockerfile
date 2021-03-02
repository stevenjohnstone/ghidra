FROM ubuntu
ENV GHIDRA_DOWNLOAD_SHA256 "8cf8806dd5b8b7c7826f04fad8b86fc7e07ea380eae497f3035f8c974de72cf8 ghidra_9.2.2_PUBLIC_20201229.zip"
RUN apt-get update && apt-get install -y openjdk-11-jdk
RUN apt-get install -y wget ca-certificates unzip
WORKDIR /root
RUN wget https://ghidra-sre.org/ghidra_9.2.2_PUBLIC_20201229.zip
RUN echo "$GHIDRA_DOWNLOAD_SHA256" | sha256sum -c -
RUN unzip ghidra*.zip -d ghidra-tmp
RUN mv ghidra-tmp/ghidra* bin
RUN sed -i 's/uiScale=1/uiScale=2/g' bin/support/launch.properties
RUN sed -i 's/bg Ghidra/fg Ghidra/g' bin/ghidraRun
CMD ["/root/bin/ghidraRun"]
