# Simple Kubernetes Install Scripts
These shell-scripts were made and used for an easier installation of a Kubernetes cluster on a network of Ubuntu 20.04 systems.

# TLDR
- **Create cluster**: Run `init_master_node.sh` to create the cluster and make the system a master node.
- **Add worker node**: Run `init_worker_node.sh` to prepare the system to be added as a worker node. Run `kubeadm_join_command.sh` on the master node and execute output on the to be worker node.
- **GPU capabilities**: Run `enable_gpu.sh` on a worker node with an NVIDIA GPU to make its gpu usable by the cluster.


# Basic Cluster setup
## init_master_node
> Run on a system to initialze a cluster and make it a master node.

Installs Kubernetes packages and makes the system a master node (control plane). Works only for the first master node, for adding consecutive master nodes the procedure is different.
Installs calico as the pod networking plugin.
Permanently disables swap on the system.

## init_worker_node
> Run on a system that will be a worker node.

Installs Kubernetes packages so the node is ready to be added to the cluster as a worker node. To add the system as a worker node run `kubeadm token create --print-join-command` on the master node and execute the output on the system to be added as a worker node.
On the worker node, check if the node has been successfully added by running `kubectl get nodes`.

## kubeadm_join_command

Prints the command that needs to be executed on a system for it to be added to the cluster as a worker node.

## reset_kubeadm
Runs the `kubeadm reset` command and does some further cleanup. Can be run on a node to remove it from the cluster.

## perma_disable_swap
Permanently disables swap by commenting out every line in the `/etc/fstab` file containung the word " swap ". Not actually used as this functionality is included in the other scripts that need it.

## setup_networking
Makes changes to networking settings. Not used in the cluster setup. Left in just in case for future use.


# GPU
## enable_gpu
Execute on a node for it to be able to run GPU workloads.
Run `kubectl describe node <gpu-node-name>` and look for the "Allocatable" section. if there is a field looking like this:
```
```
Has the combined functionality of all of the following gpu scripts.


## helm_install
Installs helm, a package manager for Kubernetes. Used to install the NVIDIA device plugin for Kubernetes. Run `helm version --short` to check the installation.

## nvidia_container_toolkit_install
Installs the nvidia-container-tookit, needed by the NVIDIA device plugin for Kubernetes. Run `nvidia-ctk --version` to check the installation.

## device_plugin_install
Install the NVIDIA device plugin for Kubernetes using helm. Run `helm list -A` to check if the plugin was installed successfully.

