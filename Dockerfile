



    FROM centos:latest

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
    RUN yum install kubelet kubeadm kubectl -y
    RUN systemctl enable kubelet
    RUN systemctl start kubelet
    RUN hostnamectl set-hostname master-node





    #
    # Last is the actual command to start up NGINX within our Container
    CMD ["k8s", "-g", "daemon off;"]
