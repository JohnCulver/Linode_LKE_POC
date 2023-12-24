# Linode_LKE_POC
Linode LKE POC

A small POC for setting up a load balanced LKE cluster with an nginx hello world deployment.

## Using the project

This project assumes you have a Linode account already setup, and you have generated an API token.


## Terraform `./terraform`

Before running any terraform commands you will need to export your linode api token:

```bash
export TF_VAR_linode_token="your_linode_api_token"
```

Run:
```bash
terraform init 
terraform apply
```


## Helm `./helm`

After the terraform has sucessfully run, login to your linode account and navigate to kubernetes clusters at `https://cloud.linode.com/kubernetes/clusters` and use `Download Kubeconfig` to get access to the cluster for performing the helm install.

To install the nginx deployment, navigate to `./helm` and run `install.sh`.

For simplicity everything is installed in the `default` namespace.

## Verification

After the helm install completes run `kubectl get po` and make sure you see at least 1 running nginx pod.

Run `kubectl get svc` and you should see a service called `hello-world`.

Wait for this service to have an `EXTERNAL-IP`.

After that you should be able to visit `http://<EXTERNAL-IP>` and see `Hello World from Nginx!`.

## Tear down

To uninstall the nginx deployment, navigate to `./helm` and run `uninstall.sh`.

To teardown the infra, navigate to `./terraform` and run `terraform destroy`.


