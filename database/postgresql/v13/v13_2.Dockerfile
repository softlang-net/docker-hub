# 支持中文的postgresql13.2
FROM postgres:13.2
RUN localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8
ENV LANG zh_CN.utf8

# add health check script
COPY pg_healthcheck /
# COPY wait-for-manager.sh /
RUN chmod +x /pg_healthcheck
HEALTHCHECK --interval=10s --retries=3 --start-period=6s CMD /pg_healthcheck