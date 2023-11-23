# Simple Kubernetes Install Scripts
These shell-scripts were made and used for an easier installation of a Kubernetes cluster on a network of Ubuntu 20.04 systems.



# init_master_node
Installs Kubernetes packages and makes the system a master node (control plane). Works only for the first master node, for adding consecutive master nodes the procedure is different.
Installs calico as the pod networking plugin.
Disables swap on the system.

# init_worker_node
Installs Kubernetes packages so the node is ready to be added to the cluster as a worker node. To add the system as a worker node run `kubeadm token create --print-join-command` on the master node and execute the output on the system to be added as a worker node.
On the worker node, check if the node has been successfully added by running `kubectl get nodes`.

# kubeadm_join_command
Prints the command that needs to be executed on a system for it to be added to the cluster as a worker node.

# reset_kubeadm
Runs the `kubeadm reset` command and does some further cleanup. Can be run on a node to remove it from the cluster.

# perma_disable_swap

# setup_networking


# GPU
##
