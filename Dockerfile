FROM centos:latest
RUN /usr/bin/yum -y update
RUN /usr/bin/yum -y install epel-release
RUN /usr/bin/yum clean all
RUN /usr/bin/yum -y install wget gstreamer gstreamer-plugins-base xorg-x11-server-Xvfb which dbus curl R R-*
RUN /usr/bin/rpm -Uvh https://download1.rstudio.org/rstudio-0.99.902-x86_64.rpm
RUN /bin/dbus-uuidgen > /etc/machine-id
RUN /usr/bin/curl https://winswitch.org/downloads/CentOS/winswitch.repo -o /etc/yum.repos.d/winswitch.repo
RUN /usr/bin/yum -y clean all
RUN /usr/bin/yum -y install xpra
EXPOSE 10010
CMD ["/usr/bin/xpra", "start", "--dpi=96", "--daemon=no", "--exit-with-children", "--start-child=/usr/lib/rstudio/bin/rstudio", "--bind-tcp=0.0.0.0:10010"]
