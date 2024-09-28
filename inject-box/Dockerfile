FROM docker.1panel.live/chisbread/wine-box:latest
COPY target/root/ /
# init wechat-box with GUI
RUN bash -c 'nohup /entrypoint.sh 2>&1 &' && sleep 5 && /payloads.sh \
    && sudo rm /tmp/.X0-lock
# clear payloads
RUN sudo rm -r /payloads
COPY root /
# init injector with GUI
RUN bash -c 'sudo nohup /entrypoint.sh 2>&1 &' && sleep 5 && /payloads.sh \
    && sudo rm /tmp/.X0-lock \
    && (sudo cp -r /*-etc/* /etc || true) \
    && (sudo chown -R app:app /drive_c && cp -r /drive_c/* /home/app/.wine/drive_c/ || true)

EXPOSE 5555
EXPOSE 5556
EXPOSE 8080

#settings
ENTRYPOINT ["/inj-entrypoint.sh"]
