# Red Hat Developer Hub Lab

Steps to create a RHDH instance using the operator.

1. Customize the `cm-app-config-rhdh.yaml` file and apply it. This file contains the `app-config.yaml` the will be merged with the defaults.
2. Customize and apply the `secrets-rhdh.yaml` file, which contains the backend auth secret.
3. Customize and apply the `cm-dynamic-plugins-rhdh.yaml`, which contains the dynamic plugins configuration that will be merged with the default dynamic-plugins.default.yaml file in the backstage pod.
4. Customize and apply the `backstage.yaml` file that contains the main custom resource.

## Extras
To configure the kubernetes integration it is necessary to define an auth method. In this lab we used the simple service account token.
From k8s 1.24 tokens for service accounts must be created. Apply the following steps:
1. Create a service account in the target namespace
2. Grant the proper rolebindings
3. Customize and apply the `sa-token.yaml` file to generate the token.
4. Use the generated token to authenticate. In this lab we passed an enviroment variable name `K8S_CLUSTER_TOKEN` in the backstage CR. This is not the proper approach in a production enviroment, where the token should be persisted in a secret.
