



    FROM centos:7

    #
    # Identify the maintainer of an image
    LABEL maintainer="blhai@company.com.vn"

    #
    # Update the image to the latest packages
    CMD [ "cat <<EOF > /etc/yum.repos.d/kubernetes.repo\
    [kubernetes]\
    name=Kubernetes\
    baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64\
    enabled=1\
    gpgcheck=1\
    repo_gpgcheck=1\
    gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg\
    EOF" ]
    RUN yum update && yum upgrade -y
    RUN yum install httpd -y
    RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
CMD ["/usr/sbin/init"]

    RUN systemctl httpd start
    RUN systemctl enable httpd
    RUN hostnamectl set-hostname master-node





    #
    # Last is the actual command to start up NGINX within our Container
    CMD ["k8s", "-g", "daemon off;"]
