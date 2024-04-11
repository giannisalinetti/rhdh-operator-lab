# Variables
backstage_ns := developer-hub

# Targets
ns:
	-kubectl create ns $(backstage_ns)

secrets:
	-kubectl apply -f secrets-rhdh.yaml -n $(backstage_ns)

configs:
	-kubectl apply -f cm-app-config-rhdh.yaml -n $(backstage_ns)
	-kubectl apply -f cm-dynamic-plugins-rhdh.yaml -n $(backstage_ns)

backstage:
	-kubectl apply -f backstage.yaml -n $(backstage_ns)

clean_backstage:
	-kubectl delete -f backstage.yaml -n $(backstage_ns)

clean_configs:
	-kubectl delete -f cm-app-config-rhdh.yaml -n $(backstage_ns)
	-kubectl delete -f cm-dynamic-plugins-rhdh.yaml -n $(backstage_ns)

clean_secrets:
	-kubectl delete -f secrets-rhdh.yaml -n $(backstage_ns)

.PHONY: all
all: ns secrets configs backstage

.PHONY: clean
clean: clean_backstage clean_configs clean_secrets
